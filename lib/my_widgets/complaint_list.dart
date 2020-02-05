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
        
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(
            20.0), //babyyy ..how is it scrolling? ... ListView tahts's why...ohhh achha
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF4F8BB),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Name and Address: ",
                style: kComplaintHeadingStyle,
              ),
              Text(
                nameAdd,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Complaint: ",
                style: kComplaintHeadingStyle,
              ),
              Text(
                comp,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Department: ",
                style: kComplaintHeadingStyle,
              ),
              Text(
                dept,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Remark: ",
                style: kComplaintHeadingStyle,
              ),
              Text(
                remark,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Complaint Date: ",
                style: kComplaintHeadingStyle,
              ),
              Text(
                dateOfComp,
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
          backgroundColor: Color(0xFFF4F8BB),
          title: Text("Respond to registered complaint "),
          contentPadding: EdgeInsets.all(30.0),
          contentTextStyle: kComplaintHeadingStyle,
          content: Column(children: <Widget>[
            TextField(
              
              scrollPadding: EdgeInsets.all(20.0),
              decoration: InputDecoration(
                  labelText: "Enter Remarks(if any)",
                  fillColor: Colors.brown,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(65.0),
                      borderSide: BorderSide())),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children:<Widget>[

                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: MaterialButton(
             
                height: 50.0,
                minWidth: 300.0,
                color: Colors.brown,
                textColor: Colors.white,
                child: Text("Submit Remark"),
                onPressed: () => {
                    Text("Submitted")
                },
                splashColor: Colors.white),
                 ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
              
                  height: 50.0,
                  minWidth: 300.0,
                  color: Colors.brown,
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
                  color: Colors.brown,
                  textColor: Colors.white,
                  child: Text("Close Complaint"),
                  onPressed: () => {},
                  splashColor: Colors.white),
            ),
                ]
              ),
            ),
            
          ]),
        );
      });
}
