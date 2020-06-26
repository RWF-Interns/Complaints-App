import 'package:LoginApp/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:LoginApp/utilities/constants.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:dio/dio.dart';
import 'package:LoginApp/screens/complaint_page.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;

class MyComplaint extends StatefulWidget {
  final name;
  final complaint;
  final department;
  final doorNo;
  final dateOfComplaint;

  MyComplaint({
    @required this.name,
    @required this.complaint,
    @required this.department,
    @required this.doorNo,
    @required this.dateOfComplaint,
  });
  @override
  _MyComplaintState createState() => _MyComplaintState();
}

class _MyComplaintState extends State<MyComplaint> {
  sendData(String remark) async {
    Response response = await Dio().get(
      url + "/4",
      queryParameters: {
        "name": widget.name,
        "complaint": widget.complaint,
        "date_of_complaint": widget.dateOfComplaint,
        "doorno": widget.doorNo,
        "department": widget.department,
        "remark": remark,
      },
    );
    print(response.data.toString());
    setState(() {
      controller.add("delete trigger");
    });
  }

  void submitMessage(BuildContext context) {
    var input = InputBox();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kBackgroundColor,
          titleTextStyle: kSubHeadingText.copyWith(color: Colors.black),
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  "Respond to Complaint",
                  style: kSubHeadingText,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                  size: 32.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                    context,
                    ComplaintPage.routeName,
                  );
                },
              ),
            ],
          ),
          contentPadding: EdgeInsets.all(12.0),
          contentTextStyle: kText,
          content: ListView(
            children: [
              Column(
                children: <Widget>[
                  input,
                  SizedBox(height: 14.0),
                  Button(
                    onPressed: () {
                      sendData(input.remark);
                      Navigator.pop(context);
                      setState(() {
                        controller.add("delete trigger");
                      });
                    },
                    text: 'SUBMIT REMARK',
                  ),
                  SizedBox(height: 6.0),
                  Button(
                    onPressed: () {
                      sendData("");
                      Navigator.pop(context);
                      setState(() {
                        controller.add("delete trigger");
                      });
                    },
                    text: 'CLOSE COMPLAINT',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: MoreGradientColors.azureLane,
              stops: [
                0.3,
                0.6,
                0.9,
              ],
            ),
            color: kButtonColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.name,
                      style: kBigText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 3.0,
                      thickness: 3.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.subdirectory_arrow_right),
                      Expanded(
                        child: Text(
                          widget.complaint,
                          style: kText.copyWith(fontSize: 22.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Department: ",
                        style: kText,
                      ),
                      Text(
                        widget.department,
                        style: kText,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Door No: ",
                        style: kText,
                      ),
                      Text(
                        widget.doorNo,
                        style: kText,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Complaint Date: ",
                        style: kText,
                      ),
                      Text(
                        widget.dateOfComplaint,
                        style: kText,
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        onTap: () {
          setState(() {
            submitMessage(context);
          });
        },
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  var remark;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) {
        remark = val;
      },
      maxLines: 12,
      scrollPadding: EdgeInsets.all(20.0),
      decoration: InputDecoration(
        labelText: "Enter Remarks(if any)",
        labelStyle: kText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: kButtonColor,
            width: 4.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
