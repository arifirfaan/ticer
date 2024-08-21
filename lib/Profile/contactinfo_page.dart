import 'package:flutter/material.dart';
import 'package:ticer/components/bottom_bar.dart';

class ContactinfoPage extends StatefulWidget {
  const ContactinfoPage({super.key});

  @override
  State<ContactinfoPage> createState() => _ContactinfoPageState();
}

class _ContactinfoPageState extends State<ContactinfoPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _noPhoneController = TextEditingController();
  bool showDoneButton = false;

  @override
  void initState() {
    super.initState();

    // Initialize the state based on current values of the controllers
    showDoneButton =
        _emailController.text.isNotEmpty && _noPhoneController.text.isNotEmpty;

    // Add listeners to controllers to update the state when the text changes
    _emailController.addListener(_updateButtonState);
    _noPhoneController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      showDoneButton = _emailController.text.isNotEmpty &&
          _noPhoneController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _noPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (showDoneButton)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2)),
              onPressed: () {
                // Handle the done action
                print('Done button pressed.');
              },
              child: const Text(
                "Done",
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Contact Information",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Email Address",
                  style: TextStyle(fontSize: 12, color: Colors.black26),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFFD9D9D9), width: 3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(
                              0xFFD9D9D9)), // Border color when not focused
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Border color when focused
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    _updateButtonState();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 12, color: Colors.black26),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _noPhoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(
                              0xFFD9D9D9)), // Border color when not focused
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Border color when focused
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    _updateButtonState();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const BottomNav(iconFlag: 2)
        ],
      ),
    );
  }
}
