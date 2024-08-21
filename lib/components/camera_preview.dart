import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPreviewScreen extends StatefulWidget {
  final CameraDescription camera;

  CameraPreviewScreen({required this.camera});

  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveImageToGallery(String path) async {
    try {
      // Request storage permission if not already granted
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      final result = await ImageGallerySaver.saveFile(path);
      print("Image saved to gallery: $result");
    } catch (e) {
      print("Error saving image to gallery: $e");
    }
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      // Take the picture and get the file location
      final XFile picture = await _controller.takePicture();

      // Construct a file path to save the image
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = '${DateTime.now()}.png';
      final String filePath = join(appDir.path, fileName);

      // Save the picture to the local file system
      final File localFile = await File(picture.path).copy(filePath);

      // Save the file to the gallery
      await _saveImageToGallery(localFile.path);

      print('Picture saved to $filePath');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Preview')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await _takePicture();
              },
              child: Text('Capture Image'),
            ),
          ),
        ],
      ),
    );
  }
}
