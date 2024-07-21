import 'package:flutter/material.dart';
import 'package:ticer/components/bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  'Profile',
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
