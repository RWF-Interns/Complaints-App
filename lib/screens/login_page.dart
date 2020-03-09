import 'package:LoginApp/custom_widgets/button.dart';
import 'package:LoginApp/custom_widgets/input_box.dart';
import 'package:LoginApp/screens/complaint_page.dart';
import 'package:LoginApp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = InputBox(
    hintText: 'Enter User ID',
    labelText: 'User ID',
  );

  var password = InputBox(
    hintText: 'Enter Password',
    labelText: 'Password',
  );

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Report Emergency',
            style: kAppBarText,
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 26.0,
                    ),
                    Column(
                      children: <Widget>[
                        username,
                        password,
                      ],
                    ),
                    Button(
                      text: 'LOGIN',
                      onPressed: () async {
                        print(username.input + " " + password.input);
                        Navigator.pushNamed(context, ComplaintPage.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
