import 'package:LoginApp/screens/login_page.dart';
import 'package:flutter/material.dart';

main() => runApp(ComplaintApp());

class ComplaintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RWF Complaint App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        LoginPage.routeName: (context) => LoginPage(),
      },
    );
  }
}
