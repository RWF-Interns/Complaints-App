import 'package:flutter/material.dart';
import 'package:LoginApp/utilities/constants.dart';

class MyComplaint extends StatelessWidget {
  final nameAdd;
  final comp;
  final dept;
  final remark;
  final dateOfComp;

  MyComplaint({
    @required this.nameAdd,
    @required this.comp,
    @required this.dept,
    @required this.remark,
    @required this.dateOfComp,
  }); // constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin:
            EdgeInsets.only(left: 15.0, right: 15.0, top: 12.0, bottom: 12.0),
        padding: EdgeInsets.all(14.0),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 4.0,
              blurRadius: 8.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4.0,
              blurRadius: 8.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4.0,
              blurRadius: 8.0,
            ),
          ],
          color: Color(0xFFBCBDBF).withOpacity(0.05),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            width: 1.0,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    nameAdd,
                    style: kText.copyWith(fontSize: 22.0),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    comp,
                    style: kText.copyWith(fontSize: 22.0),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Department: ",
                    style: kText,
                  ),
                  Text(
                    dept,
                    style: kText,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Remark: ",
                    style: kText,
                  ),
                  Text(
                    remark,
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
                    dateOfComp,
                    style: kText,
                  ),
                ],
              ),
            ]),
      ),
      onTap: () {
        submitMessage(context);
      },
    );
  }
}

void submitMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Respond to registered complaint "),
        contentPadding: EdgeInsets.all(30.0),
        contentTextStyle: kText,
        content: ListView(
          children: [
            Column(
              children: <Widget>[
                TextField(
                  maxLines: 20,
                  scrollPadding: EdgeInsets.all(20.0),
                  decoration: InputDecoration(
                      labelText: "Enter Remarks(if any)",
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide())),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MaterialButton(
                            height: 50.0,
                            minWidth: 300.0,
                            color: Color(0xFF655F63),
                            textColor: Colors.white,
                            child: Text("Submit Remark"),
                            onPressed: () => {Text("Submitted")},
                            splashColor: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MaterialButton(
                            height: 50.0,
                            minWidth: 300.0,
                            color: Color(0xFF655F63),
                            textColor: Colors.white,
                            child: Text("Attend Complaint"),
                            onPressed: () => {},
                            splashColor: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MaterialButton(
                            height: 50.0,
                            minWidth: 300.0,
                            color: Color(0xFF655F63),
                            textColor: Colors.white,
                            child: Text("Close Complaint"),
                            onPressed: () => {},
                            splashColor: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
