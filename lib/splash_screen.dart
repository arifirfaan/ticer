import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
           // The ratio of available space for this child
            child: SvgPicture.asset('assets/svg/splash_logo.svg'),
          ),

          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0), // Set your desired radius
                ),
              ),
              onPressed: (){}, child: Text('Continue with Google',style: TextStyle(color: Colors.black),))
          ),

          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0), // Set your desired radius
                ),
              ),
              onPressed: (){}, child: Text('Continue with Email')
            )
          )
        ],
      ),
    );
  }
}