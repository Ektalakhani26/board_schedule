
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';
import '../Science/science_result.dart';
import 'commerce_result.dart';

class CommerceTable extends StatefulWidget {
  const CommerceTable({super.key});

  @override
  State<CommerceTable> createState() => _CommerceTableState();
}

class _CommerceTableState extends State<CommerceTable> {
  TextEditingController account = TextEditingController();
  TextEditingController sp = TextEditingController();
  TextEditingController eco = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController BA = TextEditingController();
  TextEditingController gujaratiS = TextEditingController();
  TextEditingController gujaratiF = TextEditingController();
  TextEditingController hindi = TextEditingController();
  TextEditingController computer = TextEditingController();


  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getItemsCommarce();
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
    await SQLHelper.createItemCommarce(
      int.parse(account.text),
      int.parse(sp.text),
      int.parse(eco.text),
      int.parse(state.text),
      int.parse(BA.text),
      int.parse(gujaratiS.text),
      int.parse(gujaratiS.text),
      int.parse(hindi.text),
      int.parse(computer.text),  // Save the image path instead of _image!.path
    );
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    if(_journals.length>0) {
      print('journal is not empty');

      account.text = (_journals[_journals.length-1]['account']).toString();
      sp.text = (_journals[_journals.length-1]['sp']).toString();
      eco.text = (_journals[_journals.length-1]['eco']).toString();
      state.text = (_journals[_journals.length-1]['state']).toString();
      BA.text = (_journals[_journals.length-1]['BA']).toString();
      gujaratiS.text = (_journals[_journals.length-1]['gujaratiS']).toString();
      gujaratiF.text = (_journals[_journals.length-1]['gujaratiF']).toString();
      hindi.text = (_journals[_journals.length-1]['hindi']).toString();
      computer.text = (_journals[_journals.length-1]['computer']).toString();
    }

    return  Form(
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
                '12th Commerce',
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
                    // index: 0,
                    cells: [
                      DataCell(Text('11-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('ELEMENTS OF ACC.  (154)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: account,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    // index: 1,
                    cells: [
                      DataCell(Text('12-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('TUESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('SEC.PRACTICE   (337)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                  DataRow(
                    //index: 2,
                    cells: [
                      DataCell(Text('13-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('ECONOMICS  (022)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                    //index: 3,
                    cells: [
                      DataCell(Text('14-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('THURSDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('STATISTICS  (135)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: state,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),

                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('18-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('DRG. OF COMMERCE(046)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: BA,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 6,
                    cells: [
                      DataCell(Text('19-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('TUESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('GUJARATI(SECOND LANGUAGE) (008)\n'
                          'ENGLISH(SECOND LANGUAGE) (013)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: gujaratiS,keyboardType: TextInputType.number,
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
                      DataCell(
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.18,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('GUJRATI(FIRST LANGUAGE)  (001)', style: TextStyle(fontSize: 10, color: Colors.black)),
                                Text('HINDI(FIRST LANGUAGE) (002)', style: TextStyle(fontSize: 10, color: Colors.black)),
                                Text('MARATHI(FIRST LANGUAGE) (003)', style: TextStyle(fontSize: 10, color: Colors.black)),
                                Text('URDU(FIRST LANGUAGE) (004)', style: TextStyle(fontSize: 10, color: Colors.black)),
                                Text('SINDHI(FIRST LANGUAGE) (005)', style: TextStyle(fontSize: 10, color: Colors.black)),
                                Text('ENGLISH(FIRST LANGUAGE) (006)', style: TextStyle(fontSize: 10, color: Colors.black)),
                                Text('TAMIL (007)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
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
                        controller: gujaratiF,keyboardType: TextInputType.number,
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
                      DataCell(Text('HINDI(SECOND LANGUAGE) (009)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: hindi,keyboardType: TextInputType.number,
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
                      DataCell(Text('COM.EDUCATION(331)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: computer,keyboardType: TextInputType.number,
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
                    if (form1.currentState!.validate()) {
                      // Form is valid, proceed to save data
                      await _addcartItem();
                      // add marks from Science Table
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CommerceResult(
                        acc : account.text, Sp : sp.text,Eco : eco.text,state : state.text,BA : BA.text,gujaratiS : gujaratiS.text,
                        gujaratiF : gujaratiF.text,Hindi : hindi.text,computer : computer.text,
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
