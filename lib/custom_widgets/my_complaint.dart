import 'package:LoginApp/custom_widgets/button.dart';
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kButtonColor.withOpacity(0.3),
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
                      nameAdd,
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
                          comp,
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
                        dept,
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
        ),
        onTap: () {
          submitMessage(context);
        },
      ),
    );
  }
}

void submitMessage(BuildContext context) {
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
                TextField(
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
                ),
                SizedBox(height: 14.0),
                Button(
                  onPressed: null,
                  text: 'SUBMIT REMARK',
                ),
                SizedBox(height: 6.0),
                Button(
                  onPressed: null,
                  text: 'ATTEND COMPLAINT',
                ),
                SizedBox(height: 6.0),
                Button(
                  onPressed: null,
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
