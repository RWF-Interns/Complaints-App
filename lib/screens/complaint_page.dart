import 'dart:async';
import 'dart:convert';

import 'package:LoginApp/custom_widgets/my_complaint.dart';
import 'package:LoginApp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplaintPage extends StatefulWidget {
  ComplaintPage({Key key, this.title, @required this.flaskRoute})
      : super(key: key);

  static const routeName = 'ComplaintPage';
  final flaskRoute;
  final String title;

  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

var url = 'https://478a689b5504.ngrok.io';
List rows = [];
List<String> colNames = [];
int noOfColumns = 0;
List<DataColumn> colHeaders = [];
List<DataRow> tuples = [];
Map tuples2 = {};
StreamController<String> controller = StreamController.broadcast();
Stream stream;

class _ComplaintPageState extends State<ComplaintPage> {
  getData() async {
    colNames = [];
    tuples2 = {};
    tuples = [];
    //noOfColumns = 0;
    //colHeaders = [];
    //rows = [];
    var response = await http.get(url + '/${widget.flaskRoute}');
    print('Response status: ${response.statusCode}');
    var data = response.body;
    debugPrint(data);

    Map valueMap = json.decode(data);
    rows = valueMap['items'];
    for (int i = 0; i < rows[0].length; i++) {
      var temp = rows[0].keys.toList()[i];
      temp = temp[0].toUpperCase() + temp.substring(1);
      for (int i = 0; i < temp.length; i++) {
        if (temp[i] == '_') {
          temp = temp.substring(0, i) +
              ' ' +
              temp[i + 1].toUpperCase() +
              temp.substring(i + 2);
        }
      }
      // colNames.add(rows[0].keys.toList()[i]);
      colNames.add(temp);
    }
    print(colNames);
    setState(() {
      controller.add("triggered refresh");
    });
  }

  @override
  void initState() {
    stream = controller.stream;
    stream.listen((event) {
        print(event);
    });
    getData();
    //colHeaders = getColNames();
    super.initState();
  }

  @override
  void dispose() {
    rows = [];
    colNames = [];
    noOfColumns = 0;
    colHeaders = [];
    tuples = [];
    tuples2 = {};
    super.dispose();
    // controller.close();
  }

  var dummyTable = DataTable(
    columns: [
      DataColumn(label: Text('Waiting Data...')),
      DataColumn(label: Text('Waiting Data...')),
      DataColumn(label: Text('Waiting Data...')),
      DataColumn(label: Text('Waiting Data...')),
    ],
    rows: [
      DataRow(cells: [
        DataCell(Text('...')),
        DataCell(Text('...')),
        DataCell(Text('...')),
        DataCell(Text('...')),
      ]),
      DataRow(cells: [
        DataCell(Text('...')),
        DataCell(Text('...')),
        DataCell(Text('...')),
        DataCell(Text('...')),
      ]),
      DataRow(cells: [
        DataCell(Text('...')),
        DataCell(Text('...')),
        DataCell(Text('...')),
        DataCell(Text('...')),
      ]),
    ],
  );

  var originalTable;
  @override
  Widget build(BuildContext context) {
    // getColNames();
    getTuples2();
    getTuples();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Registered Complaints",
            style: kAppBarText,
          ),
        ),
        body: ListView.builder(
          itemCount: rows.length ?? 1,
          itemBuilder: (context, i) {
            return tuples2[i][0] != null
                ? MyComplaint(
                    name: tuples2[i][4] ?? '',
                    complaint: tuples2[i][0] ?? '',
                    department: tuples2[i][2] ?? '',
                    doorNo: tuples2[i][3] ?? '',
                    dateOfComplaint: tuples2[i][1] ?? '',
                  )
                : Text('');
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              getData();
              getTuples();
              getTuples2();
            });
            setState(() {});
          },
          tooltip: 'Refresh',
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  static getTuples() {
    List<DataRow> temp = [];
    print(rows.length);
    for (int i = 0; i < rows.length; i++) {
      temp.add(
        DataRow(
          cells: List<DataCell>.generate(
            rows[i].length,
            (j) => DataCell(
              Text(rows[i].values.toList()[j] ?? 'NULL'),
            ),
          ),
        ),
      );
    }
    tuples = temp;
    controller.add("refresh");
  }

  static getTuples2() {
    Map temp = {};
    for (int i = 0; i < rows.length; i++) {
      temp[i] = List<String>.generate(
        rows[i].length,
        (j) => rows[i].values.toList()[j] ?? 'NULL',
      );
    }
    tuples2 = temp;
    print(tuples2.length);
    controller.add("refresh");
  }
}
