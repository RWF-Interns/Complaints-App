
import 'package:LoginApp/screens/complaint_page.dart';
import 'package:flutter/material.dart';

import 'my_widgets/complaint_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Complaint Section"),
        backgroundColor: Color(0xFF5B58E3),
      ),
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage(" assets/images.jpg"),
              fit: BoxFit.cover,
              color: Colors.white70,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              
              children: <Widget>[
                Form(
                  child: Theme(
                    data: ThemeData(
                        brightness: Brightness.light,
                        primarySwatch: Colors.pink,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(
                                color: Colors.pinkAccent, fontSize: 20.0))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: "Enter User ID")),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          MaterialButton(
                              height: 50.0,
                              minWidth: 100.0,
                              color: Colors.pinkAccent,
                              textColor: Colors.black,
                              child: Text("LOGIN"),
                              onPressed: () => {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => ComplaintPage(),
                               )
                             )
                              },
                              splashColor: Colors.white)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
