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
                      Text(
                        'Receipt',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AddreceiptPage();
                          }));
                          // showCupertinoDialog(
                          //   context: context,
                          //   builder: (BuildContext context) =>
                          //       CupertinoAlertDialog(
                          //     title: Text('Add New Receipt'),
                          //     content:
                          //         Text('The feature is not ready yet Firdaus.'),
                          //     actions: <Widget>[
                          //       CupertinoDialogAction(
                          //         child: Text('Yes'),
                          //         onPressed: () {
                          //           Navigator.of(context)
                          //               .pop(); // Close the dialog
                          //         },
                          //       ),
                          //       CupertinoDialogAction(
                          //         child: Text('No'),
                          //         onPressed: () {
                          //           Navigator.of(context)
                          //               .pop(); // Close the dialog
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Center(child: Icon(Icons.add)),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200], // Background color
                  ),
                  child: TextField(
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
                        ? Center(
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
                        : Text("Got receipt"))
              ],
            ),
          ),
          BottomNav()
        ],
      ),
    );
  }
}
