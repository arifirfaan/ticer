import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticer/dashboard_page.dart';
import 'package:ticer/profile_page.dart';
import 'package:ticer/receipt_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return DashboardPage();
                  }));
                },
                icon: Column(
                  children: [
                    SvgPicture.asset('assets/svg/dashboard_icon.svg'),
                    Text('Dashboard')
                  ],
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return ReceiptPage();
                  }));
                },
                icon: Column(
                  children: [
                    SvgPicture.asset('assets/svg/receipt_icon.svg'),
                    Text('Receipt')
                  ],
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
                icon: Column(
                  children: [
                    SvgPicture.asset('assets/svg/profile_icon.svg'),
                    Text('Profile')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
