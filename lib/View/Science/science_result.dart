import 'package:GSEB_Schedule/View/Science/science_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';

class Science_Result extends StatefulWidget {
  var physics;
  var chemistry;
  var biology;
  var maths;
  var english;
  var gujarati;
  var computer;

  Science_Result({
    Key? key,
    required this.physics,
    required this.chemistry,
    required this.biology,
    required this.maths,
    required this.english,
    required this.gujarati,
    required this.computer,
  }) : super(key: key);

  Science_Result.note();

  @override
  State<Science_Result> createState() => (physics != null ) ? Science_ResultState.note() : Science_ResultState(
    physics,
    chemistry,
    biology,
    maths,
    english,
    gujarati,
    computer,
  );
}

class Science_ResultState extends State<Science_Result> {
  var physics;
  var chemistry;
  var biology;
  var maths;
  var english;
  var gujarati;
  var computer;

  Science_ResultState(this.physics, this.chemistry, this.biology, this.maths, this.english,this.gujarati ,this.computer);
  Science_ResultState.note();

  List<Map<String, dynamic>> _journals1 = [];

  void _refreshJournals1() async {
    final data = await SQLHelper.getItemsScience();
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
    var g1 = _journals1.isNotEmpty ? _journals1[a]['physice'] : 0;
    // print('g1 is : ${g1}');
    var ma = _journals1.isNotEmpty ? _journals1[a]['chemistry'] : 0;
    var ss = _journals1.isNotEmpty ? _journals1[a]['biology'] : 0;
    var sci = _journals1.isNotEmpty ? _journals1[a]['maths'] : 0;
    var eng = _journals1.isNotEmpty ? _journals1[a]['english'] : 0;
    var g2 = _journals1.isNotEmpty ? _journals1[a]['gujarati'] : 0;
    var hin = _journals1.isNotEmpty ? _journals1[a]['computer'] : 0;
    print('gujarati marks: ${g1}');

    return g1 + ma + ss + sci + eng + g2 + hin;
    return physics + chemistry + biology + maths + english  + gujarati + computer;
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
    var Physics = _journals1.isNotEmpty ? _journals1[a]['physice'] : 0;
    var Chemistry = _journals1.isNotEmpty ? _journals1[a]['chemistry'] : 0;
    var Biology = _journals1.isNotEmpty ? _journals1[a]['biology'] : 0;
    var Maths = _journals1.isNotEmpty ? _journals1[a]['maths'] : 0;
    var English = _journals1.isNotEmpty ? _journals1[a]['english'] : 0;
    var Gujarati = _journals1.isNotEmpty ? _journals1[a]['gujarati'] : 0;
    var Computer = _journals1.isNotEmpty ? _journals1[a]['computer'] : 0;
    return Scaffold(
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
            SizedBox(height: 20,),
            Text('If You are any changes in your result click here'),
//             SizedBox(height: 5,),
            SizedBox(height: 10,),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScienceTable(),));
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
                    DataCell(Text('054', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('physycs', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Physics}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('052', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Chemistry', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Chemistry}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('056', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Biology', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Biology}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('050', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Maths', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Maths}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('006', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('English', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${English}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('001', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Gujarati', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Gujarati}', style: TextStyle(fontSize: 15, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('331', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('Com.Education', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${Computer}', style: TextStyle(fontSize: 15, color: Colors.black))),
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
