import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ticer/components/camera_preview.dart';

class AddreceiptPage extends StatefulWidget {
  const AddreceiptPage({super.key});

  @override
  State<AddreceiptPage> createState() => _AddreceiptPageState();
}

class _AddreceiptPageState extends State<AddreceiptPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');

  late Directory directory;
  String fileContent = '';

  String? _selectedCategory;

  // Sample list of categories. Replace with your actual category list.
  final List<String> _categoryList = [
    'Electronic',
    'Books',
    'Education',
    'Medication',
    'Transportation',
  ];

  @override
  void initState() {
    super.initState();
    _initDirectoryAndReadFile();
  }

  // Combined method to initialize directory and read file
  Future<void> _initDirectoryAndReadFile() async {
    await _getDirectory();
    await _readFile();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _getDirectory() async {
    directory = await getApplicationDocumentsDirectory();
    debugPrint('Directory path: ${directory.path}');
  }

  Future<void> _writeFile(String content) async {
    final file = File('${directory.path}/myfile.txt');
    debugPrint('Writing to file: ${file.path}');
    await file.writeAsString(content);
  }

  Future<void> _readFile() async {
    try {
      final file = File('${directory.path}/myfile.txt');
      if (await file.exists()) {
        String contents = await file.readAsString();
        setState(() {
          fileContent = contents;
        });
      } else {
        debugPrint('File does not exist');
        setState(() {
          fileContent = 'File does not exist';
        });
      }
    } catch (e) {
      debugPrint("Error reading file: ${e.toString()}");
      setState(() {
        fileContent = 'Error reading file';
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Add Receipt",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              onTap: () async {
                final cameras = await availableCameras();
                final firstCamera = cameras.first;

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CameraPreviewScreen(camera: firstCamera);
                }));
              },
              child: Container(
                height: 160,
                width: 125,
                color: Colors.grey,
                child: const Center(
                  child: Icon(Icons.camera),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Title of Receipt",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black45),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(), // Removes the underline
                      value: _selectedCategory,
                      hint: const Text(
                        'Category',
                        style: TextStyle(fontSize: 16),
                      ),
                      items: _categoryList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black45)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            _selectedDate == null
                                ? 'Choose Date'
                                : _dateFormat.format(_selectedDate!),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  hintText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(child: Spacer()),
            InkWell(
              onTap: () {
                _writeFile('Hello, File Storage!');
                _readFile();
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            //Text(fileContent)
          ],
        ),
      ),
    );
  }
}
