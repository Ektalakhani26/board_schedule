// import 'package:GSEB_Schedule/View/SSC_Result/sss_result.dart';
// import 'package:GSEB_Schedule/ViewModel/SSC_Provider/SSC_result_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../DBHelper/DB_Helper.dart';
// import 'package:provider/provider.dart';
//
// import '../../ViewModel/SSC_Provider/ssc_model.dart';
//
// class SSCTable extends StatefulWidget {
//   const SSCTable({super.key});
//
//   @override
//   State<SSCTable> createState() => _SSCTableState();
// }
//
// class _SSCTableState extends State<SSCTable> {
//
//   final TextEditingController gujf = TextEditingController();
//   final TextEditingController math = TextEditingController();
//   final TextEditingController socials = TextEditingController();
//   final  TextEditingController science = TextEditingController();
//   final  TextEditingController english = TextEditingController();
//   final  TextEditingController gujs = TextEditingController();
//   final TextEditingController hindi = TextEditingController();
//
//
//
//   List<Map<String, dynamic>> _journals = [];
//
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = List<Map<String, dynamic>>.from(data);
//       print(_journals);
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _refreshJournals();
//   }
//
//   Future<void> _addcartItem() async {
//     await SQLHelper.createItem(
//       int.parse(gujf.text),
//       int.parse(math.text),
//       int.parse(socials.text),
//       int.parse(science.text),
//       int.parse(english.text),
//       int.parse(gujs.text),
//       int.parse(hindi.text),  // Save the image path instead of _image!.path
//     );
//     _refreshJournals();
//   }
//   @override
//   void dispose() {
//     gujf.dispose();
//     math.dispose();
//     socials.dispose();
//     science.dispose();
//     english.dispose();
//     gujs.dispose();
//     hindi.dispose();
//     super.dispose();
//   }
//   var form1 = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final sscResultProvider = Provider.of<SSC_Result_Provider>(context,listen: false);
//     print('build');
//      if(_journals.length>0) {
//        print('journal is not empty');
//        print('${_journals[_journals.length-1]['gujaratiF']}');
//        gujf.text = (_journals[_journals.length-1]['gujaratiF']).toString();
//        math.text = (_journals[_journals.length-1]['maths']).toString();
//        socials.text = (_journals[_journals.length-1]['socialscience']).toString();
//        science.text = (_journals[_journals.length-1]['science']).toString();
//        english.text = (_journals[_journals.length-1]['english']).toString();
//        gujs.text = (_journals[_journals.length-1]['gujaratiS']).toString();
//        hindi.text = (_journals[_journals.length-1]['hindi']).toString();
//      }
//     return Form(
//       key: form1,
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//              // Text('gujarati marks is : ${b}'),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.68,
//                       height: 3,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(0xFF60C476),
//                             Color(0xFF00B894),
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 3,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(width: MediaQuery.of(context).size.width * 0.05),
//                     Text(
//                       "90%",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30,),
//               Text(
//                 '10th ',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w600,
//                   height: 0,
//                 ),
//               ),
//               SizedBox(height: 20,),
//               DataTable(
//                 border: TableBorder.all(width: 1),
//                 columnSpacing: 12.0,
//                 headingRowColor: MaterialStateProperty.all<Color>(Color(0xFF4980BC)),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                 ),
//                 columns: [
//                   DataColumn(
//                     label: Text(
//                       'Date',
//                       style: TextStyle(fontWeight: FontWeight.bold,),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Day',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Subject',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Goal',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//                 rows: [
//
//                   DataRow(
//                     cells: [
//                       DataCell(Text('11-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       const DataCell(
//                         SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('GUJRATI(FIRST LANGUAGE)  (01)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('HINDI(FIRST LANGUAGE) (02)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('MARATHI(FIRST LANGUAGE) (03)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('ENGLISH(FIRST LANGUAGE) (04)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('URDU(FIRST LANGUAGE) (05)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('SINDHI(FIRST LANGUAGE) (06)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('TAMIL(SECOND LANGUAGE) (07)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('TELUGU(FIRST LANGUAGE) (08)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('UDIYA (09)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       DataCell(
//                         Consumer<SSC_Result_Provider>(
//                           builder: (context,value,child){
//                             return TextFormField(controller: gujf,keyboardType: TextInputType.number,decoration: InputDecoration(
//                                   border: InputBorder.none
//                             ),);
//                           },
//                         ),
//                       ),
//                       // DataCell(TextFormField(controller: gujf,keyboardType: TextInputType.number,decoration: InputDecoration(
//                       //   border: InputBorder.none,
//                       //
//                       // ),)),
//                     ],
//                   ),
//                   DataRow(
//                     // index: 0,
//                     cells: [
//                       DataCell(Text('13-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('STANDARD MATHS  (12)\n'
//                           'BASIC MATHS  (18)', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(TextFormField(controller: math,keyboardType: TextInputType.number,decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                       ),)),
//                     ],
//                   ),
//                   DataRow(
//                     // index: 1,
//                     cells: [
//                       DataCell(Text('15-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('FRIDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('SOCIAL SCIENCE  (10)', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(TextFormField(controller: socials,keyboardType: TextInputType.number,decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                       ),)),
//                     ],
//                   ),
//                   DataRow(
//                     //index: 2,
//                     cells: [
//                       DataCell(Text('18-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                        DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('SCIENCE  (11)', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(TextFormField(controller: science,keyboardType: TextInputType.number,decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                       ),)),
//                     ],
//                   ),
//                   DataRow(
//                     //index: 3,
//                     cells: [
//                       DataCell(Text('20-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('ENGLISH(SECOND LANGUAGE)  (16)', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(TextFormField(controller: english,keyboardType: TextInputType.number,decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                       ),)),
//                     ],
//                   ),
//                   DataRow(
//                     //index: 4,
//                     cells: [
//                       DataCell(Text('21-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('THURSDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(
//                         Text(
//                           'GUJRATI(SECOND LANGUAGE) (13) ',
//                           style: TextStyle(fontSize: 10, color: Colors.black),
//                         ),
//                       ),
//                       DataCell(TextFormField(controller: gujs,keyboardType: TextInputType.number,decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                       ),)),
//                     ],
//                   ),
//                   DataRow(
//                     cells: [
//                       DataCell(Text('22-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(Text('FRIDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
//                       DataCell(
//                         SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('HINDI(SECOND LANGUAGE) (14)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('SINDHI(SECOND LANGUAGE) (15)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('TAMIL(FIRST LANGUAGE) (007)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('SANSKRIT(SECOND LANGUAGE (17)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('FARSI(SECOND LANGUAGE) (19)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('ARABI(SECOND LANGUAGE) (20)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                               Text('URDU(SECOND LANGUAGE) (21)', style: TextStyle(fontSize: 10, color: Colors.black)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       DataCell(TextFormField(controller: hindi,keyboardType: TextInputType.number,decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                       ),)),
//                     ],
//                   ),
//
//                 ],
//               ),
//               SizedBox(height: 20,),
//               Text(
//                 'Timing 9:30 to 12:00',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w500,
//                   height: 0,
//                 ),
//               ),
//               SizedBox(height: 40,),
//               Container(
//                 height: 40,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     sscResultProvider.setSSCResult(SSCResultModel(
//                       gujarati1: gujf.text,
//                       maths: math.text,
//                       socialscience: socials.text,
//                       science: science.text,
//                       english: english.text,
//                       gujarati2: gujs.text,
//                       hindi: hindi.text,
//                     ));
//                    // await _addcartItem();
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => SSCResult(
//                       gujarati1: gujf.text,
//                       maths: math.text,
//                       socialscience: socials.text,
//                       science: science.text,
//                       english: english.text,
//                       gujarati2: gujs.text,
//                       hindi: hindi.text,
//                         // gujarati1: gujf,maths: math,
//                         // socialscience: socials,science: science,english: english,gujarati2: gujs,hindi: hindi
//                     )),);
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius
//                           .all(Radius.circular(0))),
//                       backgroundColor: Colors.green,
//                       content: Row(
//                         children: [
//                           Icon(Icons.check_circle, color: Colors.white),
//                           Expanded(child: Text(
//                               'final Result',
//                               style: TextStyle(color: Colors.white))),
//                         ],
//                       ),
//                     ));
//                   //  if(form1.currentState!.validate()) {}
//                     // _addcartItem();
//                     //    Navigator.push(context, MaterialPageRoute(builder: (context) => SSCResult(gujarati1: gujf,maths: math,socialscience: socials,science: science,english: english,gujarati2: gujs,hindi: hindi)),);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFF054A97),
//                     onPrimary: Colors.white,
//                     textStyle: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                   ),
//                   child: Text("Submit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:GSEB_Schedule/View/SSC_Result/sss_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DBHelper/DB_Helper.dart';
import '../../ViewModel/SSC_Provider/SSC_result_provider.dart';
import '../../ViewModel/SSC_Provider/ssc_model.dart';
import '../splash_screen.dart';

class SSCTable extends StatefulWidget {
  const SSCTable({super.key});

  @override
  State<SSCTable> createState() => _SSCTableState();
}

class _SSCTableState extends State<SSCTable> {

  TextEditingController gujf = TextEditingController();
  TextEditingController math = TextEditingController();
  TextEditingController socials = TextEditingController();
  TextEditingController science = TextEditingController();
  TextEditingController english = TextEditingController();
  TextEditingController gujs = TextEditingController();
  TextEditingController hindi = TextEditingController();


  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = List<Map<String, dynamic>>.from(data);
      print(_journals);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // listenToNotifications();
    _refreshJournals();
  }
  Future<void> _addcartItem() async {
    await SQLHelper.createItem(
      int.parse(gujf.text),
      int.parse(math.text),
      int.parse(socials.text),
      int.parse(science.text),
      int.parse(english.text),
      int.parse(gujs.text),
      int.parse(hindi.text),  // Save the image path instead of _image!.path
    );
    _refreshJournals();
  }
  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, int.parse(gujf.text),
      int.parse(math.text),
      int.parse(socials.text),
      int.parse(science.text),
      int.parse(english.text),
      int.parse(gujs.text),
      int.parse(hindi.text));
    _refreshJournals();
  }

  var form1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print('build');
    if(_journals.length>0) {
       print('journal is not empty');
       print('${_journals[_journals.length-1]['gujaratiF']}');
       gujf.text = (_journals[_journals.length-1]['gujaratiF']).toString();
       math.text = (_journals[_journals.length-1]['maths']).toString();
       socials.text = (_journals[_journals.length-1]['socialscience']).toString();
       science.text = (_journals[_journals.length-1]['science']).toString();
       english.text = (_journals[_journals.length-1]['english']).toString();
       gujs.text = (_journals[_journals.length-1]['gujaratiS']).toString();
       hindi.text = (_journals[_journals.length-1]['hindi']).toString();
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
                '10th ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(height: 20,),
              DataTable(
                border: TableBorder.all(width: 1),
                columnSpacing: 12.0,
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
                    cells: [
                      DataCell(Text('11-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      const DataCell(
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('GUJRATI(FIRST LANGUAGE)  (01)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('HINDI(FIRST LANGUAGE) (02)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('MARATHI(FIRST LANGUAGE) (03)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('ENGLISH(FIRST LANGUAGE) (04)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('URDU(FIRST LANGUAGE) (05)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('SINDHI(FIRST LANGUAGE) (06)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('TAMIL(SECOND LANGUAGE) (07)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('TELUGU(FIRST LANGUAGE) (08)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('UDIYA (09)', style: TextStyle(fontSize: 10, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      DataCell(
                        Consumer<SSC_Result_Provider>(
                          builder: (context,sscResultValue,child){
                            return TextFormField(
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
                              onChanged: (value) {
                                _updateItem(_journals[0]['id']);
                                gujf.text = value;
                              },
                              controller: gujf,
                             // initialValue: gujf.text,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(border: InputBorder.none),);
                          },
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    // index: 0,
                    cells: [
                      DataCell(Text('13-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('STANDARD MATHS  (12)\n'
                          'BASIC MATHS  (18)', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(
                          TextFormField(
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
                            controller: math,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none),)),
                    ],
                  ),
                  DataRow(
                    // index: 1,
                    cells: [
                      DataCell(Text('15-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('FRIDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('SOCIAL SCIENCE  (10)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: socials,keyboardType: TextInputType.number,decoration: InputDecoration(border: InputBorder.none),)),
                    ],
                  ),
                  DataRow(
                    //index: 2,
                    cells: [
                      DataCell(Text('18-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('MONDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('SCIENCE  (11)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: science,keyboardType: TextInputType.number,decoration: InputDecoration(border: InputBorder.none),)),
                    ],
                  ),
                  DataRow(
                    //index: 3,
                    cells: [
                      DataCell(Text('20-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('WEDNESDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('ENGLISH(SECOND LANGUAGE)  (16)', style: TextStyle(fontSize: 10, color: Colors.black))),
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
                        controller: english,keyboardType: TextInputType.number,decoration: InputDecoration(border: InputBorder.none),)),
                    ],
                  ),
                  DataRow(
                    //index: 4,
                    cells: [
                      DataCell(Text('21-03-2024', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(Text('THURSDAY', style: TextStyle(fontSize: 10, color: Colors.black))),
                      DataCell(
                        Text(
                          'GUJRATI(SECOND LANGUAGE) (13) ',
                          style: TextStyle(fontSize: 10, color: Colors.black),
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
                        controller: gujs,keyboardType: TextInputType.number,decoration: InputDecoration(border: InputBorder.none),)),
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
                            children: [
                              Text('HINDI(SECOND LANGUAGE) (14)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('SINDHI(SECOND LANGUAGE) (15)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('TAMIL(FIRST LANGUAGE) (007)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('SANSKRIT(SECOND LANGUAGE (17)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('FARSI(SECOND LANGUAGE) (19)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('ARABI(SECOND LANGUAGE) (20)', style: TextStyle(fontSize: 10, color: Colors.black)),
                              Text('URDU(SECOND LANGUAGE) (21)', style: TextStyle(fontSize: 10, color: Colors.black)),
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
                        controller: hindi,keyboardType: TextInputType.number,decoration: InputDecoration(border: InputBorder.none),)),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Text(
                'Timing 9:30 to 12:00',
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
                    // add marks from SSC Table
                    if (form1.currentState!.validate()) {
                      // Form is valid, proceed to save data
                      await _addcartItem();
                      //  std = '10';

                      Navigator.push(context, MaterialPageRoute(builder: (context) => SSCResult(gujarati1: gujf.text,
                        maths: math.text,
                        socialscience: socials.text,
                        science: science.text,
                        english: english.text,
                        gujarati2: gujs.text,
                        hindi: hindi.text,)));
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
              //  Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}