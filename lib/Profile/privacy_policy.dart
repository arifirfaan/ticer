import 'package:flutter/material.dart';
import 'package:ticer/components/bottom_bar.dart';
import 'package:ticer/constant/text_const.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                  "Privacy Policy",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  child: Text(
                    TextConst.pnpContent,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868686)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    TextConst.pnpContent2,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868686)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    "Information Gathering and Usage",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    TextConst.infoGatherUsage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868686)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    TextConst.infoGatherUsage2,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868686)),
                  ),
                ),
              ],
            ),
          ),
          const BottomNav(iconFlag: 3)
        ],
      ),
    );
  }
}
