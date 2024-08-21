import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticer/components/bottom_bar.dart';
import 'package:ticer/Profile/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget listAddedWidget = const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Machines Sdn Bhd",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          Text("DD / MM / YY",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
      Text("RM 00.00",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF9D9D9D)),
                        ),
                        Text(
                          'Muhammad',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ), // Dynamic Name
                      ],
                    ),
                    ClipOval(
                      child: Image.network(
                        'https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg', // Use your image URL here
                        width: 56, // Adjust the width as needed
                        height: 56, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF333333),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('You have spent this month',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('RM 0.00',
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Last Receipt Added",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(4)),
                    child: listAddedWidget),
                const SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(4)),
                    child: listAddedWidget),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      SvgPicture.asset('assets/svg/dashboard_vector.svg'),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 150,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reports",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            Text("You can view expenses reports in categories",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400))
                          ],
                        ),
                      )
                    ]))
              ],
            ),
          ),
          BottomNav(iconFlag: 1),
        ],
      ),
    );
  }
}
