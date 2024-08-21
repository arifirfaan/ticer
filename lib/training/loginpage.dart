// //import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:newpppp/dashboard_page.dart';
// import 'package:newpppp/sign_up_page.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// bool _backgroundIsolateStarted = false; // Ensure initialization only once

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: "AIzaSyCdh1PiHbd9hrl3u21Q6HsY410xwcFKHeM",
//       appId: '1:292337937678:android:0e1b2ab4cf24a7d1ae7b5f',
//       messagingSenderId: '292337937678',
//       projectId: 'solatdulu-a0b85',
//       storageBucket: 'solatdulu-a0b85.appspot.com',
//     ),
//   );
//   if (!_backgroundIsolateStarted) {
//     _backgroundIsolateStarted = true;
//     //await AndroidAlarmManager.initialize();
//   }

//   //const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/app_icon');
//   //const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
//   //await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int alarmId = 321;

//   static Future<void> _showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'alarm_channel',
//       'Alarm Channel',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       321,
//       'Alarm',
//       'Your alarm is ringing!',
//       platformChannelSpecifics,
//       payload: 'Alarm Payload',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Column(
//         children: [
//           LoginScreen(),
//         ],
//       ),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   static Future<User?> loginUsingEmailPassword(
//       {required String email,
//       required String password,
//       required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         print("No user found for that email");
//       }
//     }
//     return user;
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();

//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         children: [
//           const Text(
//             "SolatDulu",
//             style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//           const Text("Login to Your App"),
//           const SizedBox(height: 40),
//           TextField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               hintText: "User Email",
//               prefixIcon: Icon(Icons.mail, color: Colors.black),
//             ),
//           ),
//           const SizedBox(height: 40),
//           TextField(
//             controller: _passwordController,
//             obscureText: true,
//             decoration: const InputDecoration(
//               hintText: "User Password",
//               prefixIcon: Icon(Icons.lock, color: Colors.black),
//             ),
//           ),
//           const SizedBox(height: 12),
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => SignUpPage()));
//               },
//               child: Text("Register New?")),
//           const SizedBox(height: 80),
//           SizedBox(
//             width: double.infinity,
//             child: RawMaterialButton(
//               onPressed: () async {
//                 User? user = await loginUsingEmailPassword(
//                     email: _emailController.text,
//                     password: _passwordController.text,
//                     context: context);
//                 print(user);
//                 if (user != null) {
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       builder: (context) => DropdownButtonExample()));
//                 }
//               },
//               fillColor: Colors.blueGrey,
//               child: const Text("Login"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
