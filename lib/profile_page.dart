import 'package:flutter/material.dart';
import 'package:ticer/components/bottom_bar.dart';
import 'package:flutter/cupertino.dart';

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

  Widget submenu({required String title, required Function onpressed}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onpressed(),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Icon(Icons.navigate_next)],
          ),
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
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
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
                      SizedBox(
                        width: 14,
                      ),
                      Column(
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
                submenu(title: "Email Address", onpressed: () {}),
                submenu(title: "Phone Number", onpressed: () {}),
                submenu(title: "Upgrade to Pro", onpressed: () {}),
                submenu(title: "Terms and Conditions", onpressed: () {}),
                submenu(title: "Privacy Policy", onpressed: () {}),
                submenu(title: "Backup Data", onpressed: () {}),
                submenu(title: "Clear Data", onpressed: () {}),
                InkWell(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure to logout?'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('Yes'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child: Center(
                          child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ))),
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
