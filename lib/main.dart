import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<bool> selected1;
  List<bool> selected2;
  
  List<String> list1 = ['1', '2'];
  List<String> list2 = ['1', '2'];

  @override
  void initState() {
    super.initState();
    selected1 = List<bool>.generate(list1.length, (index) => false);
    selected2 = List<bool>.generate(list2.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Tabela em AlerDialog"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Table"),
                          content: DataTable(
                            columns: [
                              DataColumn(label: Text('Name')),
                            ],
                            rows: list1.map(
                              ((value) => DataRow(
                                selected: selected1[list1.indexOf(value)],
                                onSelectChanged: (val) {
                                  setState(() {
                                    selected1[list1.indexOf(value)] = val;
                                  });
                                },
                                cells: [
                                  DataCell(Text("valor")),
                                ],
                              )),
                            ).toList(),
                          ),
                          actions: [
                            FlatButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("Cancelar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                  ],
                  rows: list2.map(
                    ((value) => DataRow(
                      selected: selected2[list2.indexOf(value)],
                      onSelectChanged: (val) {
                        setState(() {
                          selected2[list2.indexOf(value)] = val;
                        });
                      },
                      cells: [
                        DataCell(Text('valor')),
                      ],
                    )),
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
