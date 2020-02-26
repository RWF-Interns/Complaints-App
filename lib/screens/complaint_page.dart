import 'package:LoginApp/my_widgets/complaint_list.dart';
import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF655F63),
        ),
        body: Scrollbar(
          child: ListView(
            children: <Widget>[
              MyComplaint(
                nameAdd: "Subhan",
                comp: "Pipe Leakage",
                dateOfComp: "02/02/2020",
                dept: "CV",
                remark: "Repair",
              ),
              MyComplaint(
                nameAdd: "Haju",
                comp: "Door ",
                dateOfComp: "01/02/2020",
                dept: "CV",
                remark: "Replace",
              ),
              MyComplaint(
                nameAdd: "Sara",
                comp: "tubelight not working",
                dateOfComp: "05-02-2020",
                dept: "Elec",
                remark: "Repair",
              ),
              MyComplaint(
                nameAdd: "Prasad Rao",
                comp: "Window",
                dateOfComp: "21/02/2020",
                dept: "Civil",
                remark: "Replace",
              ),
              MyComplaint(
                nameAdd: "Prasad Rao",
                comp: "Window",
                dateOfComp: "21/02/2020",
                dept: "Civil",
                remark: "Replace",
              ),
              MyComplaint(
                nameAdd: "Prasad Rao",
                comp: "Window",
                dateOfComp: "21/02/2020",
                dept: "Civil",
                remark: "Replace",
              ),
              MyComplaint(
                nameAdd: "Prasad Rao",
                comp: "Window",
                dateOfComp: "21/02/2020",
                dept: "Civil",
                remark: "Replace",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
