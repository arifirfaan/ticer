import 'package:flutter/material.dart';
import 'package:ticer/dashboard_page.dart';
import 'package:ticer/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(), // Your existing content
    Center(child: Text('Do\'a Page')), // Example Placeholder widget for the second tab
    Center(child: Text('Profile Page')), // Example Placeholder widget for the third tab
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
    // Scaffold(
    //   // appBar: AppBar(
    //   //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //   //   title: Text(widget.title),
    //   // ),
    //   body: Center(
    //     child: Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height,
    //       child: _widgetOptions.elementAt(_selectedIndex)),
    //   ),
      
    //   //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   bottomNavigationBar: BottomAppBar(
    //     shape: CircularNotchedRectangle(),
    //     notchMargin: 6.0,
    //     child: BottomNavigationBar(
    //       backgroundColor: Colors.white,
    //       items: const <BottomNavigationBarItem>[
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.grid_view_rounded),
    //           label: 'Dashboard',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.inventory_2_outlined),
    //           label: "Receipt",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.person_pin),
    //           label: 'Profile',
    //         ),
    //       ],
    //       currentIndex: _selectedIndex, 
    //       selectedItemColor: Colors.blue[900],
    //       onTap: _onItemTapped,
    //     ),
    //   ),
    // );
  }
}
