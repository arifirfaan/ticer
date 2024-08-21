import 'package:flutter/material.dart';
import 'package:ticer/Profile/privacy_policy.dart';
import 'package:ticer/Profile/term_condition.dart';
import 'package:ticer/components/bottom_bar.dart';

class AppRegulatePage extends StatefulWidget {
  const AppRegulatePage({super.key});

  @override
  State<AppRegulatePage> createState() => _AppRegulatePageState();
}

class _AppRegulatePageState extends State<AppRegulatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                const Text(
                  "App Regulations",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TermConditionPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Terms and Conditions",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PrivacyPolicyPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Privacy Policy",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
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
