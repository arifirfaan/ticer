import 'package:flutter/material.dart';
import 'package:ticer/Profile/appregulate_page.dart';
import 'package:ticer/components/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticer/Profile/contactinfo_page.dart';
import 'package:ticer/training/createnew_list.dart';
import 'package:ticer/training/jsondisplay.dart';
import 'package:ticer/main.dart';
import 'package:ticer/training/updateview.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget submenu(
      {required String title,
      required String subtitle1,
      required String subtitle2,
      required Function onpressed}) {
    return InkWell(
      onTap: () {
        onpressed();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xFFE7E9DF)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust this value as needed
                      ),
                    ),
                    onPressed: () {},
                    child: Text(subtitle1)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust this value as needed
                      ),
                    ),
                    onPressed: () {
                      //onpressed();
                    },
                    child: Text(subtitle2))
                //Text(title), Icon(Icons.navigate_next)
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE7E9DF)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg', // Use your image URL here
                          width: 56, // Adjust the width as needed
                          height: 56, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Muhammad bin Ahmad",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "muhammadfirdaus.work@gmail.com",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xFFE7E9DF)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Storage",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "500MB available",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                submenu(
                    title: "Contact Information",
                    subtitle1: "Email Address",
                    subtitle2: "Phone Number",
                    onpressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ContactinfoPage();
                      }));
                    }),
                submenu(
                    title: "Apps Regulations",
                    subtitle1: "Terms and Conditions",
                    subtitle2: "Privacy Policy",
                    onpressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const AppRegulatePage();
                      }));
                    }),
                submenu(
                    title: "Data",
                    subtitle1: "Backup Data",
                    subtitle2: "Clear Data",
                    onpressed: () {}),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      //return MyHomePage1();
                      return ViewPage(projectId: "001");
                    }));
                  },
                  child: Text("test update"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      //return MyHomePage1();
                      return ProjectListPage();
                    }));
                  },
                  child: Text("test show"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      //return MyHomePage1();
                      return AddProjectPage();
                    }));
                  },
                  child: Text("test add new"),
                ),
                InkWell(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure to logout?'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child: const Center(
                          child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))),
                )
              ],
            ),
          ),
          const BottomNav(iconFlag: 3)
        ],
      ),
    );
  }
}
