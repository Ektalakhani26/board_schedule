import 'package:GSEB_Schedule/View/Arts/arts_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';

class ArtsResult extends StatefulWidget {

  var english;
  var gujarati;
  var eco;
  var sanskrit;
  var Philosophy;
  var psychology;
  var sp;

  ArtsResult({
    Key? key,
    required this.english,
    required this.gujarati,
    required this.eco,
    required this.sanskrit,
    required this.Philosophy,
    required this.psychology,
    required this.sp,
  }) : super(key: key);

  ArtsResult.note();

  @override
  State<ArtsResult> createState() => (english != null) ? ArtsResultState.note() : ArtsResultState(
    english,
    gujarati,
    eco,
    sanskrit,
    Philosophy,
    psychology,
    sp,
  );
}

class ArtsResultState extends State<ArtsResult> {

  var english;
  var gujarati;
  var eco;
  var sanskrit;
  var Philosophy;
  var psychology;
  var sp;

  ArtsResultState(this.english, this.gujarati, this.eco, this.sanskrit, this.Philosophy,this.psychology ,this.sp);
  ArtsResultState.note();

  List<Map<String, dynamic>> _journals1 = [];

  void _refreshJournals1() async {
    final data = await SQLHelper.getItemsArts();
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
    var g1 = _journals1.isNotEmpty ? _journals1[a]['english'] : 0;
    // print('g1 is : ${g1}');
    var ma = _journals1.isNotEmpty ? _journals1[a]['gujarati'] : 0;
    var ss = _journals1.isNotEmpty ? _journals1[a]['eco'] : 0;
    var sci = _journals1.isNotEmpty ? _journals1[a]['sanskrit'] : 0;
    var eng = _journals1.isNotEmpty ? _journals1[a]['philosophy'] : 0;
    var g2 = _journals1.isNotEmpty ? _journals1[a]['psychology'] : 0;
    var hin = _journals1.isNotEmpty ? _journals1[a]['sp'] : 0;
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
    var English = _journals1.isNotEmpty ? _journals1[a]['english'] : 0;
    var Gujarati = _journals1.isNotEmpty ? _journals1[a]['gujarati'] : 0;
    var Eco = _journals1.isNotEmpty ? _journals1[a]['eco'] : 0;
    var Sanskrit = _journals1.isNotEmpty ? _journals1[a]['sanskrit'] : 0;
    var Philosophy = _journals1.isNotEmpty ? _journals1[a]['philosophy'] : 0;
    var Psychology = _journals1.isNotEmpty ? _journals1[a]['psychology'] : 0;
    var Sp = _journals1.isNotEmpty ? _journals1[a]['sp'] : 0;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 120,
              width: 120,
              child:Image(
                image: AssetImage("assets/SSCLogo.png"),
              ) ,
            ),

            Text('If You are any changes in your result click here'),
//             SizedBox(height: 5,),
            SizedBox(height: 10,),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArtsTable(),));
                },
                child: Text('Edit',style: TextStyle(color: Colors.blue),)),
            SizedBox(height: 5,),
            Text("HSC EXAMINATION RESULT",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
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
              //dataRowMinHeight: 20,
              //  dataRowHeight: 32,
              //headingRowColor: MaterialStateProperty.all<Color>(Color(0xFF4980BC)),
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
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('013', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('ENGLISH(S.L)', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${English}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('001', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('GUJRATI(F.L)', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Gujarati}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('022', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('ECONOMICS', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Eco}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('129', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('SANSKRIT', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Sanskrit}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('136', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('PHILOSOPHY', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Philosophy}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('141', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('PSYCHOLOGY', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Psychology}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('337', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('SEC.PRACTICE', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Sp}', style: TextStyle(fontSize: 15, color: Colors.black))),
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
                      'PR : ${calculatePercentage().toStringAsFixed(2)}%',
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
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
