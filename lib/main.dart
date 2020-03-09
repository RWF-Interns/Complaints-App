import 'package:LoginApp/screens/complaint_page.dart';
import 'package:LoginApp/screens/login_page.dart';
import 'package:LoginApp/utilities/constants.dart';
import 'package:flutter/material.dart';

main() => runApp(ComplaintApp());

class ComplaintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RWF Complaint App',
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme(
          color: kAppBarColor,
          brightness: Brightness.light,
          elevation: 6.0,
          iconTheme: IconThemeData(
            color: kBackgroundColor,
          ),
          actionsIconTheme: IconThemeData(
            color: kBackgroundColor,
          ),
        ),
      ),
      routes: {
        '/': (context) => LoginPage(),
        LoginPage.routeName: (context) => LoginPage(),
        ComplaintPage.routeName: (context) => ComplaintPage(),
      },
    );
  }
}
