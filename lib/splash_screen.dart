import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticer/dashboard_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 40, top: 20),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            // The ratio of available space for this child
            child: SvgPicture.asset('assets/svg/splash_logo.svg'),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius:
                          BorderRadius.circular(8.0), // Set your desired radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const DashboardPage();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/google_icon.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ))),
          Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius:
                          BorderRadius.circular(8.0), // Set your desired radius
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail_outline, color: Colors.black),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Continue with Email',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "By continuing, you acknowledge that understand and agree to the Terms and Conditions and Privacy Policy.",
              style: TextStyle(
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
