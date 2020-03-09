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
  Map<String, List> credentials = {
    'abc1': ['abc1', '1'],
    'abc2': ['abc2', '2'],
    'abc3': ['abc3', '3'],
    'xyz1': ['xyz1', '1'],
    'xyz2': ['xyz2', '2'],
    'xyz3': ['xyz3', '3'],
  };

  var username = InputBox(
    hintText: 'Enter User ID',
    labelText: 'User ID',
    keyboardType: TextInputType.text,
  );

  var password = InputBox(
    hintText: 'Enter Password',
    labelText: 'Password',
    keyboardType: TextInputType.text,
    obscureText: true,
  );

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
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
                        SizedBox(
                          height: 16.0,
                        ),
                        password,
                      ],
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    Button(
                      text: 'LOGIN',
                      onPressed: () async {
                        print(username.input + " " + password.input);
                        if (credentials
                                .containsKey(username.input.toString()) &&
                            credentials[username.input][0] == password.input) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Login Successful',
                                  style: kHeadingText.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                titleTextStyle: kSubHeadingText,
                                titlePadding: EdgeInsets.all(6.0),
                                actions: <Widget>[
                                  Button(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   ComplaintPage.routeName,
                                      // );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ComplaintPage(
                                            flaskRoute:
                                                credentials[username.input][1],
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'GO',
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Wrong UID/Password',
                                  style: kHeadingText.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                titleTextStyle: kSubHeadingText,
                                titlePadding: EdgeInsets.all(6.0),
                                actions: <Widget>[
                                  Button(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(
                                        context,
                                        LoginPage.routeName,
                                      );
                                    },
                                    text: 'RETRY',
                                  ),
                                ],
                              );
                            },
                          );
                        }
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
