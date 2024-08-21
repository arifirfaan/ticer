import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticer/dashboard_page.dart';
import 'package:ticer/Profile/profile_page.dart';
import 'package:ticer/receipt_page.dart';

class BottomNav extends StatelessWidget {
  final int iconFlag;

  const BottomNav({super.key, required this.iconFlag});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 80,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12, width: 2)),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/dashboard_icon.svg',
                      color: iconFlag == 1 ? Colors.black : Color(0xFFD9D9D9),
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        color: iconFlag == 1 ? Colors.black : Color(0xFFD9D9D9),
                      ),
                    )
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/receipt_icon.svg',
                      color: iconFlag == 2 ? Colors.black : Color(0xFFD9D9D9),
                    ),
                    Text(
                      'Receipt',
                      style: TextStyle(
                        color: iconFlag == 2 ? Colors.black : Color(0xFFD9D9D9),
                      ),
                    )
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/profile_icon.svg',
                      color: iconFlag == 3 ? Colors.black : Color(0xFFD9D9D9),
                    ),
                    Text('Profile',
                        style: TextStyle(
                            color: iconFlag == 3
                                ? Colors.black
                                : Color(0xFFD9D9D9)))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
