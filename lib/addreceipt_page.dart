import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        child: ListView(
          children: [
            Text(
              "Add Receipt",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () async {
                // Obtain a list of available cameras on the device.
                final cameras = await availableCameras();
                // Get a specific camera from the list of available cameras.
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
                child: Center(
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
                          Text(
                            'Date',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            _selectedDate == null
                                ? 'Choose Date'
                                : _dateFormat.format(_selectedDate!),
                            style: TextStyle(fontSize: 16),
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
            InkWell(
                onTap: () {},
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
