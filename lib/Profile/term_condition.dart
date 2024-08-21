import 'package:flutter/material.dart';
import 'package:ticer/components/bottom_bar.dart';
import 'package:ticer/constant/text_const.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: const [
                Text(
                  "Terms and Condition",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "User Account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    TextConst.tncUserAccount,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868686)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "User of the Mobile App",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    TextConst.tncUserMobileApp,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868686)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "Content",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      TextConst.tncContent,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868686)),
                    )),
              ],
            ),
          ),
          const BottomNav(iconFlag: 3)
        ],
      ),
    );
  }
}
