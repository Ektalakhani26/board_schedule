
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';
import 'arts_result.dart';

class ArtsTable extends StatefulWidget {
  const ArtsTable({super.key});

  @override
  State<ArtsTable> createState() => _ArtsTableState();
}

class _ArtsTableState extends State<ArtsTable> {
  TextEditingController english = TextEditingController();
  TextEditingController gujarati = TextEditingController();
  TextEditingController eco = TextEditingController();
  TextEditingController sanskrit = TextEditingController();
  TextEditingController philosophy = TextEditingController();
  TextEditingController psychology = TextEditingController();
  TextEditingController sp = TextEditingController();


  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getItemsArts();
    setState(() {
      _journals = List<Map<String, dynamic>>.from(data);
      print(_journals);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshJournals();
  }
  var form1 = GlobalKey<FormState>();
  Future<void> _addcartItem() async {
    await SQLHelper.createItemArts(
      int.parse(english.text),
      int.parse(gujarati.text),
      int.parse(eco.text),
      int.parse(sanskrit.text),
      int.parse(philosophy.text),
      int.parse(psychology.text),
      int.parse(sp.text),  // Save the image path instead of _image!.path
    );
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    if(_journals.length>0) {
      print('journal is not empty');

      english.text = (_journals[_journals.length-1]['english']).toString();
      gujarati.text = (_journals[_journals.length-1]['gujarati']).toString();
      eco.text = (_journals[_journals.length-1]['eco']).toString();
      sanskrit.text = (_journals[_journals.length-1]['sanskrit']).toString();
      philosophy.text = (_journals[_journals.length-1]['philosophy']).toString();
      psychology.text = (_journals[_journals.length-1]['psychology']).toString();
      sp.text = (_journals[_journals.length-1]['sp']).toString();
    }
    return Form(
      key: form1,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.68,
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF60C476),
                            Color(0xFF00B894),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 3,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Text(
                      "90%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text(
                '12th Arts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(height: 40,),
              DataTable(
                border: TableBorder.all(width: 1),
                columnSpacing: 12.0,
                dataRowMaxHeight: double.infinity,
                headingRowColor: MaterialStateProperty.all<Color>(Color(0xFF4980BC)),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                columns: [
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Subject',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Goal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('19-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('TUESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('ENGLISH(SECOND LANGUAGE) (013)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: english,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell( Text('GUJRATI(FIRST LANGUAGE)  (001)', style: TextStyle(fontSize: 10, color: Colors.black)),
                      ),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: gujarati,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('21-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('THURSDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('ECONOMICS (022)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: eco,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('22-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('FRIDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('SANSKRIT(129)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: sanskrit,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('23-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('SATURDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('PHILOSOPHY (136)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: philosophy,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('26-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('TUESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('PSYCHOLOGY (141)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: psychology,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('26-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('TUESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('SEC.PRACTICE (337)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          int intValue = int.tryParse(value) ?? 0;
                          if (intValue < 0 || intValue > 100) {
                            return 'Please enter a valid number between 0 and 100';
                          }
                          return null; // Return null if the validation is successful
                        },
                        controller: sp,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                'Timing 3:00 to 6:00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () async {
                    // add marks from 12th Arts Table
                    if (form1.currentState!.validate()) {
                      // Form is valid, proceed to save data
                      await _addcartItem();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ArtsResult(
                        english : english.text,gujarati : gujarati.text,eco : eco.text,sanskrit : sanskrit.text,
                        Philosophy : philosophy.text,psychology : psychology.text,sp : sp.text,
                      )),);
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF054A97),
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text("Submit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
