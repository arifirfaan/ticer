import 'package:flutter/material.dart';
import 'package:ticer/components/bottom_bar.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Text(
                  'Receipt',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          BottomNav()
        ],
      ),
    );
  }
}
