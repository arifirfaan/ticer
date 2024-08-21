import 'package:flutter/material.dart';
import 'package:ticer/addreceipt_page.dart';
import 'package:ticer/components/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  var receiptList = [];
  bool addbool = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Receipt',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addbool = !addbool;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: const Center(child: Icon(Icons.add)),
                            ),
                          ],
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200], // Background color
                  ),
                  child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          hintText: 'Search',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          border: InputBorder.none, // Remove the default border
                          suffixIcon: Icon(CupertinoIcons.mic_fill),
                          prefixIcon: Icon(CupertinoIcons.search))),
                ),
                Expanded(
                    child: receiptList.isEmpty
                        ? const Center(
                            child: SizedBox(
                              width: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "You haven't save any receipt yet",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Scan or import your document to save your first receipt",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Text("Got receipt"))
              ],
            ),
          ),
          addbool == true
              ? Positioned(
                  right: 20,
                  top: 55,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return AddreceiptPage();
                            }));
                          },
                          child: const Text(
                            "Take Picture",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          height: 1, // Spacing before and after the divider
                          width: 130, // Thickness of the line
                          color: Colors.black12, // Color of the line
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return AddreceiptPage();
                            }));
                          },
                          child: const Text(
                            "Upload from Gallery",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          const BottomNav(iconFlag: 2)
        ],
      ),
    );
  }
}
