  // Future signUp() async {
  //   debugPrint('test');
  //   if(passwordConfirm()) {
  //     FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  //     popupSuccess();
  //   }
  // }

  // void popupSuccess(){
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Successful!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
  //         content: Text('Thank you for using SolatDulu as your prayer apps.'),
  //         actions: [
  //           TextButton(
  //             child: const Text('Back to Login Page'),
  //             onPressed: () {
  //               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage(title: "solatdulu",)));
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // bool passwordConfirm(){
  //    debugPrint('password confirm = ' + _repasswordController.text);
  //   if (_passwordController.text.trim() == _repasswordController.text.trim()){
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }