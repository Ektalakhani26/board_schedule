// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // import '../../DBHelper/DB_Helper.dart';
// // //
// // // class SSCResult extends StatefulWidget {
// // //   var gujarati1;
// // //   var maths;
// // //   var socialscience;
// // //   var science;
// // //   var english;
// // //   var gujarati2;
// // //   var hindi;
// // //   SSCResult ({Key? key, required  this.gujarati1,required this.maths,
// // //     required this.socialscience,required this.science,required this.english,
// // //     required this.gujarati2,required this.hindi}) : super(key: key);
// // //
// // //   @override
// // //   State<SSCResult> createState() => SSCResultState(
// // //       int.parse(gujarati1),
// // //       int.parse(maths),
// // //       int.parse(socialscience),
// // //       int.parse(science),
// // //       int.parse(english),
// // //       int.parse(gujarati2),
// // //       int.parse(hindi));
// // // }
// // //
// // // class SSCResultState extends State<SSCResult> {
// // //   var gujarati1;
// // //   var maths;
// // //   var socialscience;
// // //   var science;
// // //   var english;
// // //   var gujarati2;
// // //   var hindi;
// // //   SSCResultState(this.gujarati1, this.maths, this.socialscience, this.science, this.english, this.gujarati2, this.hindi);
// // //
// // //   List<Map<String, dynamic>> _journals1 = [];
// // //   void _refreshJournals1() async {
// // //     final data = await SQLHelper.getItems();
// // //     setState(() {
// // //       _journals1 = data;
// // //       print('data : $data');
// // //     });
// // //   }
// // //   @override
// // //   void initState() {
// // //     // TODO: implement initState
// // //     super.initState();
// // //     _refreshJournals1();
// // //   }
// // //  // var sum= ${gujarati1+maths+socialscience+science+english+gujarati2+hindi};
// // //
// // //
// // //   int calculateTotalMarks() {
// // //     return gujarati1 + maths + socialscience + science + english + gujarati2 + hindi;
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //     body: SingleChildScrollView(
// // //       child: Column(
// // //         children: [
// // //           Padding(
// // //             padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 Expanded(
// // //                   child: Container(
// // //                     width: MediaQuery.of(context).size.width ,
// // //                     height: 3,
// // //                     decoration: BoxDecoration(
// // //                       gradient: LinearGradient(
// // //                         colors: [
// // //                           Color(0xFF60C476),
// // //                           Color(0xFF00B894),
// // //                         ],
// // //                         begin: Alignment.topLeft,
// // //                         end: Alignment.bottomRight,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: MediaQuery.of(context).size.width * 0.05),
// // //                 Text(
// // //                   "100%",
// // //                   style: TextStyle(
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           SizedBox(height: 20,),
// // //           Container(
// // //             height: 120,
// // //             width: 120,
// // //             child:Image(
// // //               image: AssetImage("assets/SSCLogo.png"),
// // //             ) ,
// // //           ),
// // //           SizedBox(height: 10,),
// // //           Text("SSC EXAMINATION RESULT",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
// // //           SizedBox(height: 10,),
// // //           DataTable(
// // //             horizontalMargin: 20,
// // //             border: TableBorder.all(width: 1),
// // //             columnSpacing: 25,
// // //             dataRowMaxHeight: double.infinity,
// // //             //dataRowMinHeight: 20,
// // //           //  dataRowHeight: 32,
// // //             //headingRowColor: MaterialStateProperty.all<Color>(Color(0xFF4980BC)),
// // //             decoration: BoxDecoration(
// // //               border: Border.all(color: Colors.black),
// // //             ),
// // //               columns: [
// // //                 DataColumn(
// // //                   label: Text(
// // //                     'Subject Code',
// // //                     style: TextStyle(fontWeight: FontWeight.bold,),
// // //                   ),
// // //                 ),
// // //                 DataColumn(
// // //                   label: Text(
// // //                     'Subject Name',
// // //                     style: TextStyle(
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 DataColumn(
// // //                   label: Text(
// // //                     'Mark',
// // //                     style: TextStyle(
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             rows:  <DataRow>[
// // //
// // //               DataRow(
// // //                 cells: <DataCell>[
// // //                   DataCell(Text('01', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('GujaratiF', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${gujarati1}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //
// // //               DataRow(
// // //                 cells: [
// // //                   DataCell(Text('18', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('Basic Maths', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${maths}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //               DataRow(
// // //                 cells: [
// // //                   DataCell(Text('10', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('Social Science', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${socialscience}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //               DataRow(
// // //                 cells: [
// // //                   DataCell(Text('11', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('Science', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${science}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //               DataRow(
// // //                 cells: [
// // //                   DataCell(Text('16', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('English', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${english}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //               DataRow(
// // //                 cells: [
// // //                   DataCell(Text('13', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('GujaratiS', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${gujarati2}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //               DataRow(
// // //                 cells: [
// // //                   DataCell(Text('21', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('Sanskrit/Hindi', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                   DataCell(Text('${hindi}', style: TextStyle(fontSize: 15, color: Colors.black))),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //           SizedBox(height: 15,),
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 40),
// // //             child: Container(
// // //               width: MediaQuery.of(context).size.width,
// // //               height: 30,
// // //               decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
// // //               child: Row(
// // //                 children: [
// // //                   SizedBox(width: 15,),
// // //
// // //                   Text(
// // //                     'Total Mark : ${calculateTotalMarks().toString()}',
// // //                     textAlign: TextAlign.center,
// // //                     style: TextStyle(
// // //                       color: Colors.black,
// // //                       fontSize: 12,
// // //                       fontFamily: 'Inter',
// // //                       fontWeight: FontWeight.w600,
// // //                       height: 0,
// // //                     ),
// // //                   ),
// // //                   SizedBox(width: 80,),
// // //                   Text(
// // //                     'PR :           ',
// // //                     textAlign: TextAlign.center,
// // //                     style: TextStyle(
// // //                       color: Colors.black,
// // //                       fontSize: 12,
// // //                       fontFamily: 'Inter',
// // //                       fontWeight: FontWeight.w600,
// // //                       height: 0,
// // //                     ),
// // //                   ),
// // //                   Spacer(),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           SizedBox(height: 15,),
// // //           Text("Congratulation !! you have passed this exam",
// // //             style: TextStyle(color: Color(0xFF60C476),
// // //                 fontWeight: FontWeight.bold,fontSize: 16
// // //             ),
// // //           ),
// // //           SizedBox(height: 25,),
// // //           Text.rich(
// // //             TextSpan(
// // //               children: [
// // //                 TextSpan(
// // //                   text: 'We ',
// // //                   style: TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 18,
// // //                     fontFamily: 'Inter',
// // //                     fontWeight: FontWeight.w400,
// // //                     height: 0,
// // //                   ),
// // //                 ),
// // //                 TextSpan(
// // //                   text: 'Congratulate',
// // //                   style: TextStyle(
// // //                     color: Color(0xFFFE0000),
// // //                     fontSize: 18,
// // //                     fontFamily: 'Inter',
// // //                     fontWeight: FontWeight.w600,
// // //                     height: 0,
// // //                   ),
// // //                 ),
// // //                 TextSpan(
// // //                   text: ' You On The \nSuccess Today That Marks A \nBeginenig For The \nSuccess Tomorrow!!!',
// // //                   style: TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 18,
// // //                     fontFamily: 'Inter',
// // //                     fontWeight: FontWeight.w400,
// // //                     height: 0,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             textAlign: TextAlign.center,
// // //           )
// // //         ],
// // //       ),
// // //      ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // import '../../DBHelper/DB_Helper.dart';
// //
// // class SSCResult extends StatefulWidget {
// //   var gujarati1;
// //   var maths;
// //   var socialscience;
// //   var science;
// //   var english;
// //   var gujarati2;
// //   var hindi;
// //
// //   SSCResult({
// //     Key? key,
// //     required this.gujarati1,
// //     required this.maths,
// //     required this.socialscience,
// //     required this.science,
// //     required this.english,
// //     required this.gujarati2,
// //     required this.hindi,
// //   }) : super(key: key);
// //
// //   @override
// //   State<SSCResult> createState() => SSCResultState(
// //     int.parse(gujarati1),
// //     int.parse(maths),
// //     int.parse(socialscience),
// //     int.parse(science),
// //     int.parse(english),
// //     int.parse(gujarati2),
// //     int.parse(hindi),
// //   );
// // }
// //
// // class SSCResultState extends State<SSCResult> {
// //   var gujarati1;
// //   var maths;
// //   var socialscience;
// //   var science;
// //   var english;
// //   var gujarati2;
// //   var hindi;
// //
// //   SSCResultState(this.gujarati1, this.maths, this.socialscience, this.science, this.english, this.gujarati2, this.hindi);
// //
// //   List<Map<String, dynamic>> _journals1 = [];
// //
// //   void _refreshJournals1() async {
// //     final data = await SQLHelper.getItems();
// //     setState(() {
// //       _journals1 = data;
// //       print('data : $data');
// //     });
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _refreshJournals1();
// //   }
// //
// //   int calculateTotalMarks() {
// //     return gujarati1 + maths + socialscience + science + english + gujarati2 + hindi;
// //   }
// //
// //   double calculatePercentage() {
// //     // Assuming the maximum marks for all subjects is 100 (change as needed)
// //     final double maxMarksPerSubject = 100;
// //     final int totalMarks = calculateTotalMarks();
// //     final double percentage = (totalMarks / (7 * maxMarksPerSubject)) * 100;
// //
// //     return percentage;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Expanded(
// //                     child: Container(
// //                       width: MediaQuery.of(context).size.width,
// //                       height: 3,
// //                       decoration: BoxDecoration(
// //                         gradient: LinearGradient(
// //                           colors: [
// //                             Color(0xFF60C476),
// //                             Color(0xFF00B894),
// //                           ],
// //                           begin: Alignment.topLeft,
// //                           end: Alignment.bottomRight,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: MediaQuery.of(context).size.width * 0.05),
// //                   Text(
// //                     "100%",
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 20,),
// //             Container(
// //               height: 120,
// //               width: 120,
// //               child: Image(
// //                 image: AssetImage("assets/SSCLogo.png"),
// //               ),
// //             ),
// //             SizedBox(height: 10,),
// //             Text(
// //               "SSC EXAMINATION RESULT",
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
// //             ),
// //             SizedBox(height: 10,),
// //             DataTable(
// //               horizontalMargin: 20,
// //               border: TableBorder.all(width: 1),
// //               columnSpacing: 25,
// //               headingRowColor: MaterialStatePropertyAll<Color>(
// //                   Colors.amber
// //               ),
// //               dataRowColor: MaterialStatePropertyAll<Color>(
// //                   Colors.amber.shade200
// //               ),
// //               dataRowMaxHeight: double.infinity,
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: Colors.black),
// //               ),
// //               columns: [
// //                 DataColumn(
// //                   label: Text(
// //                     'Subject Code',
// //                     style: TextStyle(fontWeight: FontWeight.bold,),
// //                   ),
// //                 ),
// //                 DataColumn(
// //                   label: Text(
// //                     'Subject Name',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //                 DataColumn(
// //                   label: Text(
// //                     'Mark',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //               rows: <DataRow>[
// //                 DataRow(
// //                   cells: <DataCell>[
// //                     DataCell(Text('01', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('GujaratiF', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${gujarati1}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //                 DataRow(
// //                   cells: [
// //                     DataCell(Text('18', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('Basic Maths', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${maths}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //                 DataRow(
// //                   cells: [
// //                     DataCell(Text('10', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('Social Science', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${socialscience}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //                 DataRow(
// //                   cells: [
// //                     DataCell(Text('11', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('Science', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${science}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //                 DataRow(
// //                   cells: [
// //                     DataCell(Text('16', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('English', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${english}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //                 DataRow(
// //                   cells: [
// //                     DataCell(Text('13', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('GujaratiS', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${gujarati2}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //                 DataRow(
// //                   cells: [
// //                     DataCell(Text('21', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('Sanskrit/Hindi', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                     DataCell(Text('${hindi}', style: TextStyle(fontSize: 15, color: Colors.black))),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 15,),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 40),
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width,
// //                 height: 30,
// //                 decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
// //                 child: Row(
// //                   children: [
// //                     SizedBox(width: 15,),
// //
// //                     Text(
// //                       'Total Mark : ${calculateTotalMarks().toString()}',
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: Colors.black,
// //                         fontSize: 12,
// //                         fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w600,
// //                         height: 0,
// //                       ),
// //                     ),
// //                     SizedBox(width: 80,),
// //                     Text(
// //                       'Percentage : ${calculatePercentage().toStringAsFixed(2)}%',
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: Colors.black,
// //                         fontSize: 12,
// //                         fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w600,
// //                         height: 0,
// //                       ),
// //                     ),
// //                     Spacer(),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 15,),
// //             Text("Congratulation !! you have passed this exam",
// //               style: TextStyle(color: Color(0xFF60C476),
// //                   fontWeight: FontWeight.bold,fontSize: 16
// //               ),
// //             ),
// //             SizedBox(height: 25,),
// //             Text.rich(
// //               TextSpan(
// //                 children: [
// //                   TextSpan(
// //                     text: 'We ',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 18,
// //                       fontFamily: 'Inter',
// //                       fontWeight: FontWeight.w400,
// //                       height: 0,
// //                     ),
// //                   ),
// //                   TextSpan(
// //                     text: 'Congratulate',
// //                     style: TextStyle(
// //                       color: Color(0xFFFE0000),
// //                       fontSize: 18,
// //                       fontFamily: 'Inter',
// //                       fontWeight: FontWeight.w600,
// //                       height: 0,
// //                     ),
// //                   ),
// //                   TextSpan(
// //                     text: ' You On The \nSuccess Today That Marks A \nBeginenig For The \nSuccess Tomorrow!!!',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 18,
// //                       fontFamily: 'Inter',
// //                       fontWeight: FontWeight.w400,
// //                       height: 0,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               textAlign: TextAlign.center,
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:GSEB_Schedule/View/SSC_Result/ssc_table.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../DBHelper/DB_Helper.dart';
//
// class SSCResult extends StatefulWidget {
//   var gujarati1;
//   var maths;
//   var socialscience;
//   var science;
//   var english;
//   var gujarati2;
//   var hindi;
//   var flag;
//
//   SSCResult({
//     Key? key,
//     required this.gujarati1,
//     required this.maths,
//     required this.socialscience,
//     required this.science,
//     required this.english,
//     required this.gujarati2,
//     required this.hindi,
//   }) : super(key: key);
//
//   @override
//   State<SSCResult> createState() => SSCResultState(
//     gujarati1,
//     maths,
//     socialscience,
//     science,
//     english,
//     gujarati2,
//     hindi,
//   );
// }
//
// class SSCResultState extends State<SSCResult> {
//   TextEditingController gujarati1;
//   TextEditingController maths;
//   TextEditingController socialscience;
//   TextEditingController science;
//   TextEditingController english;
//   TextEditingController gujarati2;
//   TextEditingController hindi;
//   SSCResultState(
//       this.gujarati1,
//       this.maths,
//       this.socialscience,
//       this.science,
//       this.english,
//       this.gujarati2,
//       this.hindi,
//       );
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
//     super.initState();
//     _refreshJournals();
//   }
//
//   int calculateTotalMarks() {
//     return int.parse(gujarati1.text) +
//         int.parse(maths.text) +
//         int.parse(socialscience.text) +
//         int.parse(science.text) +
//         int.parse(english.text) +
//         int.parse(gujarati2.text) +
//         int.parse(hindi.text);
//   }
//
//   double calculatePercentage() {
//     // Assuming the maximum marks for all subjects is 100 (change as needed)
//     final double maxMarksPerSubject = 100;
//     final int totalMarks = calculateTotalMarks();
//     final double percentage =
//         (totalMarks / (7 * maxMarksPerSubject)) * 100;
//
//     return percentage;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   //   var a = _journals.isNotEmpty ? _journals.length - 1 : 0;
//   // //  print('gujarati2 marks: ${_journals.isNotEmpty ? _journals[a]['gujaratiS'] : 'N/A'}');
//   //   var g1 = int.tryParse(gujarati1.text);
//   //   g1 = (_journals.isNotEmpty) ? _journals[a]['gujaratiF'] : 0 ;
//   //   var ma = int.tryParse(maths.text);
//   //   ma = (_journals.isNotEmpty) ? _journals[a]['maths'] : 0 ;
//   //   var ss = int.tryParse(socialscience.text);
//   //   ss = (_journals.isNotEmpty) ? _journals[a]['socialscience'] : 0 ;
//   //   var sci = int.tryParse(science.text);
//   //   sci = (_journals.isNotEmpty) ? _journals[a]['science'] : 0 ;
//   //   var eng = int.tryParse(english.text);
//   //   eng = (_journals.isNotEmpty) ? _journals[a]['english'] : 0 ;
//   //   var g2 = int.tryParse(gujarati2.text);
//   //   g2 = (_journals.isNotEmpty) ? _journals[a]['gujaratiS'] : 0 ;
//   //   var hin = int.tryParse(hindi.text);
//   //   hin = (_journals.isNotEmpty) ? _journals[a]['hindi'] : 0 ;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20,),
//             Container(
//               height: 120,
//               width: 120,
//               child: Image(
//                 image: AssetImage("assets/SSCLogo.png"),
//               ),
//             ),
//             SizedBox(height: 10,),
//             SizedBox(width: 20,),
//             Text('If You are any changes in your result click here'),
//             SizedBox(height: 5,),
//             InkWell(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SSCTable(),));
//                 },
//                 child: Text('Edit',style: TextStyle(color: Colors.blue),)),
//
//             SizedBox(height: 5,),
//             Text(
//               "SSC EXAMINATION RESULT",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 5,),
//             DataTable(
//               horizontalMargin: 20,
//               border: TableBorder.all(width: 1),
//               columnSpacing: 25,
//               headingRowColor: MaterialStatePropertyAll<Color>(
//                   Colors.amber
//               ),
//               dataRowColor: MaterialStatePropertyAll<Color>(
//                   Colors.amber.shade200
//               ),
//               dataRowMaxHeight: double.infinity,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//               ),
//               columns: [
//                 DataColumn(
//                   label: Text(
//                     'Subject Code',
//                     style: TextStyle(fontWeight: FontWeight.bold,),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Subject Name',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Mark',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//               rows: <DataRow>[
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text('01', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('GujaratiF', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${gujarati1}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('18', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('Basic Maths', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${maths}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('10', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('Social Science', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${socialscience}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('11', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('Science', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${science}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('16', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('English', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${english}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('13', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('GujaratiS', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${gujarati2}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('21', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('Sanskrit/Hindi', style: TextStyle(fontSize: 15, color: Colors.black))),
//                     DataCell(Text('${hindi}', style: TextStyle(fontSize: 15, color: Colors.black))),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 30,
//                 decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
//                 child: Row(
//                   children: [
//                     SizedBox(width: 15,),
//                     Text(
//                       'Total Mark : ${calculateTotalMarks().toString()}',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                         height: 0,
//                       ),
//                     ),
//                     SizedBox(width: 80,),
//                     Text(
//                       'Percentage : ${calculatePercentage().toStringAsFixed(2)}%',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                         height: 0,
//                       ),
//                     ),
//                     Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//             Text("Congratulation !! you have passed this exam",
//               style: TextStyle(color: Color(0xFF60C476),
//                   fontWeight: FontWeight.bold,fontSize: 16
//               ),
//             ),
//             SizedBox(height: 10,),
//             Text.rich(
//               TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'We ',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 17,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Congratulate',
//                     style: TextStyle(
//                       color: Color(0xFFFE0000),
//                       fontSize: 17,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w600,
//                       height: 0,
//                     ),
//                   ),
//                   TextSpan(
//                     text: ' You On The \nSuccess Today That Marks A \nBeginning For The \nSuccess Tomorrow!!!',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 17,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:GSEB_Schedule/View/SSC_Result/ssc_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';

class SSCResult extends StatefulWidget {
  var gujarati1;
  var maths;
  var socialscience;
  var science;
  var english;
  var gujarati2;
  var hindi;


  SSCResult({
    Key? key,
    required this.gujarati1,
    required this.maths,
    required this.socialscience,
    required this.science,
    required this.english,
    required this.gujarati2,
    required this.hindi,
  }) : super(key: key);

  SSCResult.note();

  @override
  State<SSCResult> createState() => (gujarati1!=null) ? SSCResultState.note() : SSCResultState(gujarati1,maths,socialscience,science,english,gujarati2,hindi);
}

class SSCResultState extends State<SSCResult> {
  var gujarati1;
  var maths;
  var socialscience;
  var science;
  var english;
  var gujarati2;
  var hindi;

  List<Map<String, dynamic>> _journals1 = [];

  SSCResultState.note();

  SSCResultState(this.gujarati1, this.maths, this.socialscience, this.science, this.english, this.gujarati2, this.hindi);

  void _refreshJournals1() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals1 = data;
      print('data : $data');
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals1();
  }

  int calculateTotalMarks() {
    var a = _journals1.isNotEmpty ? _journals1.length - 1 : 0;
    var g1 = _journals1.isNotEmpty ? _journals1[a]['gujaratiF'] : 0;
   // print('g1 is : ${g1}');
    var ma = _journals1.isNotEmpty ? _journals1[a]['maths'] : 0;
    var ss = _journals1.isNotEmpty ? _journals1[a]['socialscience'] : 0;
    var sci = _journals1.isNotEmpty ? _journals1[a]['science'] : 0;
    var eng = _journals1.isNotEmpty ? _journals1[a]['english'] : 0;
    var g2 = _journals1.isNotEmpty ? _journals1[a]['gujaratiS'] : 0;
    var hin = _journals1.isNotEmpty ? _journals1[a]['hindi'] : 0;
    print('gujarati marks: ${g1}');

      return g1 + ma + ss + sci + eng + g2 + hin;

  }

  double calculatePercentage() {
    // Assuming the maximum marks for all subjects is 100 (change as needed)
    final double maxMarksPerSubject = 100;
    final int totalMarks = calculateTotalMarks();
    final double percentage = (totalMarks / (7 * maxMarksPerSubject)) * 100;

    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    var a = _journals1.isNotEmpty ? _journals1.length - 1 : 0;
    var g1 = _journals1.isNotEmpty ? _journals1[a]['gujaratiF'] : 0;
    print('g1 is : ${g1}');
    var ma = _journals1.isNotEmpty ? _journals1[a]['maths'] : 0;
    var ss = _journals1.isNotEmpty ? _journals1[a]['socialscience'] : 0;
    var sci = _journals1.isNotEmpty ? _journals1[a]['science'] : 0;
    var eng = _journals1.isNotEmpty ? _journals1[a]['english'] : 0;
    var g2 = _journals1.isNotEmpty ? _journals1[a]['gujaratiS'] : 0;
    var hin = _journals1.isNotEmpty ? _journals1[a]['hindi'] : 0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 120,
              width: 120,
              child: Image(
                image: AssetImage("assets/SSCLogo.png"),
              ),
            ),
            SizedBox(width: 20,),
             Text('If You are any changes in your result click here'),
//             SizedBox(height: 5,),
            SizedBox(height: 10,),
        InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SSCTable(),));
                  //Navigator.pop(context);
                },
                child: Text('Edit',style: TextStyle(color: Colors.blue),)),
            SizedBox(height: 5,),
            Text(
              "SSC EXAMINATION RESULT",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10,),
            DataTable(
              horizontalMargin: 20,
              border: TableBorder.all(width: 1),
              columnSpacing: 25,
              headingRowColor: MaterialStatePropertyAll<Color>(
                  Colors.amber
              ),
              dataRowColor: MaterialStatePropertyAll<Color>(
                  Colors.amber.shade200
              ),
              dataRowMaxHeight: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'Subject Code',
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Subject Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mark',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('01', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('GujaratiF', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${g1}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('18', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Basic Maths', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${ma}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('10', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Social Science', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${ss}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('11', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Science', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${sci}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('16', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('English', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${eng}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('13', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('GujaratiS', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${g2}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('21', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Sanskrit/Hindi', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${hin}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Text(
                      'Total Mark : ${calculateTotalMarks().toString()}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(width: 80,),
                    Text(
                      'Percentage : ${calculatePercentage().toStringAsFixed(2)}%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text("Congratulation !! you have passed this exam",
              style: TextStyle(color: Color(0xFF60C476),
                  fontWeight: FontWeight.bold,fontSize: 16
              ),
            ),
            SizedBox(height: 5,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'We ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Congratulate',
                    style: TextStyle(
                      color: Color(0xFFFE0000),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: ' You On The \nSuccess Today That Marks A \nBeginenig For The \nSuccess Tomorrow!!!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}