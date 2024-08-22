import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _cameraController.initialize();
    setState(() {}); // Rebuild the widget once initialization is complete
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();

      setState(() {
        _imageFile = image;
      });

      // Save the image to local storage
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      await image.saveTo(imagePath);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(child: CameraPreview(_cameraController)),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _takePicture,
                  icon: Icon(Icons.camera),
                  label: Text('Capture Image'),
                ),
                SizedBox(height: 10),
                _imageFile == null
                    ? Text('No image captured')
                    : Image.file(File(_imageFile!.path)),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Failed to initialize camera'));
          }
        },
      ),
    );
  }
}
