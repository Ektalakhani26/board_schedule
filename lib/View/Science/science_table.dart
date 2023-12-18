
import 'package:GSEB_Schedule/View/Science/science_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';

class ScienceTable extends StatefulWidget {
  const ScienceTable({Key? key});

  @override
  State<ScienceTable> createState() => ScienceTableState();
}

class ScienceTableState extends State<ScienceTable> {
  TextEditingController physics = TextEditingController();
  TextEditingController chemistry = TextEditingController();
  TextEditingController biology = TextEditingController();
  TextEditingController maths = TextEditingController();
  TextEditingController english = TextEditingController();
  TextEditingController gujarati = TextEditingController();
  TextEditingController computer = TextEditingController();


  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getItemsScience();
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
  Future<void> _addcartItem() async {
    await SQLHelper.createItemScience(
      int.parse(physics.text),
      int.parse(chemistry.text),
      int.parse(biology.text),
      int.parse(maths.text),
      int.parse(english.text),
      int.parse(gujarati.text),
      int.parse(computer.text),  // Save the image path instead of _image!.path
    );
    _refreshJournals();
  }
  var form1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if(_journals.length>0) {
      print('journal is not empty');

      physics.text = (_journals[_journals.length-1]['physice']).toString();
      chemistry.text = (_journals[_journals.length-1]['chemistry']).toString();
      biology.text = (_journals[_journals.length-1]['biology']).toString();
      maths.text = (_journals[_journals.length-1]['maths']).toString();
      english.text = (_journals[_journals.length-1]['english']).toString();
      gujarati.text = (_journals[_journals.length-1]['gujarati']).toString();
      computer.text = (_journals[_journals.length-1]['computer']).toString();
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
                '12th Science',
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
                      DataCell(Text('PHYSICS  (054)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: physics,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                   // index: 1,
                    cells: [
                      DataCell(Text('13-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('CHEMISTRY  (052)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: chemistry,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 2,
                    cells: [
                      DataCell(Text('15-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('FRIDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('BIOLOGY  (056)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: biology,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 3,
                    cells: [
                      DataCell(Text('18-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('MATHS  (050)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: maths,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    //index: 4,
                    cells: [
                      DataCell(Text('20-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ENGLISH(FIRST LANGUAGE) (006)  \nENGLISH(SECOND LANGUAGE) (013)',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                            ],
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
                        controller: english,keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('22-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('FRIDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(
                       SingleChildScrollView(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('GUJRATI(FIRST LANGUAGE)  (001)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('HINDI(FIRST LANGUAGE) (002)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('MARATHI(FIRST LANGUAGE) (003)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('URDU(FIRST LANGUAGE) (004)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('SINDHI(FIRST LANGUAGE) (005)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('TAMIL(FIRST LANGUAGE) (007)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('GUJRATI(SECOND LANGUAGE) (008)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('HINDI(FIRST LANGUAGE) (009)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('SANSKRIT (129)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('PARSIAN (130)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('ARABIC (131)', style: TextStyle(fontSize: 10, color: Colors.black)),
                             Text('PRAKRIT (132)', style: TextStyle(fontSize: 10, color: Colors.black)),
                           ],
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
                    // add marks from 12th Science Table
                    if (form1.currentState!.validate()) {
                      // Form is valid, proceed to save data
                      await _addcartItem();

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Science_Result(
                        physics : physics.text,chemistry : chemistry.text,biology : biology.text,maths : maths.text,english : english.text,
                        gujarati : gujarati.text,computer : computer.text,
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
