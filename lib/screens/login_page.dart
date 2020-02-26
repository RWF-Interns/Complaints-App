import 'package:LoginApp/custom_widgets/bottom_button.dart';
import 'package:LoginApp/custom_widgets/input_box.dart';
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
    text: 'Boss ID',
    hintText: 'Enter Boss ID',
    icon: Icon(
      Icons.supervised_user_circle,
      size: 24.0,
    ),
  );

  var password = InputBox(
    text: 'Boss-Word',
    hintText: 'Enter Boss Password',
    icon: Icon(
      Icons.vpn_key,
      size: 24.0,
    ),
    obscureText: true,
  );

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Boss Word',
            style: kInputBoxStyle,
          ),
          titleSpacing: 2.5,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: kRedColor,
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          color: kRedColor,
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
                    BottomButton(
                      text: 'LOGIN',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
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
