
import 'package:GSEB_Schedule/View/Commerce/commerce_table.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DB_Helper.dart';

class CommerceResult extends StatefulWidget {
  var acc;
  var Sp;
  var Eco;
  var state;
  var BA;
  var gujaratiS;
  var gujaratiF;
  var Hindi;
  var computer;

  CommerceResult({
    Key? key,
    required this.acc,
    required this.Sp,
    required this.Eco,
    required this.state,
    required this.BA,
    required this.gujaratiS,
    required this.gujaratiF,
    required this.Hindi,
    required this.computer,
  }) : super(key: key);

  CommerceResult.note();
  @override
  State<CommerceResult> createState() => (acc != null) ? CommerceResultState.note() : CommerceResultState(
    acc,
    Sp,
    Eco,
    state,
    BA,
    gujaratiS,
    gujaratiF,
    Hindi,
    computer,
  );
}

class CommerceResultState extends State<CommerceResult> {
  var acc;
  var Sp;
  var Eco;
  var state;
  var BA;
  var gujaratiS;
  var gujaratiF;
  var Hindi;
  var computer;

  CommerceResultState(this.acc, this.Sp, this.Eco, this.state, this.BA,this.gujaratiS,this.gujaratiF,this.Hindi ,this.computer);
  CommerceResultState.note();

  List<Map<String, dynamic>> _journals1 = [];

  void _refreshJournals1() async {
    final data = await SQLHelper.getItemsCommarce();
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
    var g1 = _journals1.isNotEmpty ? _journals1[a]['account'] : 0;
    // print('g1 is : ${g1}');
    var ma = _journals1.isNotEmpty ? _journals1[a]['sp'] : 0;
    var ss = _journals1.isNotEmpty ? _journals1[a]['eco'] : 0;
    var sci = _journals1.isNotEmpty ? _journals1[a]['state'] : 0;
    var eng = _journals1.isNotEmpty ? _journals1[a]['BA'] : 0;
    var g2 = _journals1.isNotEmpty ? _journals1[a]['gujaratiS'] : 0;
    var hin = _journals1.isNotEmpty ? _journals1[a]['gujaratiF'] : 0;
    var hin1 = _journals1.isNotEmpty ? _journals1[a]['hindi'] : 0;
    var hin2 = _journals1.isNotEmpty ? _journals1[a]['computer'] : 0;
    print('gujarati marks: ${g1}');

    return g1 + ma + ss + sci + eng + g2 + hin + hin1 + hin2;
  }

  double calculatePercentage() {
    // Assuming the maximum marks for all subjects is 100 (change as needed)
    final double maxMarksPerSubject = 100;
    final int totalMarks = calculateTotalMarks();
    final double percentage = (totalMarks / (9 * maxMarksPerSubject)) * 100;

    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    var a = _journals1.isNotEmpty ? _journals1.length - 1 : 0;
    var Acc = _journals1.isNotEmpty ? _journals1[a]['account'] : 0;
    var Sp = _journals1.isNotEmpty ? _journals1[a]['sp'] : 0;
    var Eco = _journals1.isNotEmpty ? _journals1[a]['eco'] : 0;
    var State1 = _journals1.isNotEmpty ? _journals1[a]['state'] : 0;
    var Ba = _journals1.isNotEmpty ? _journals1[a]['BA'] : 0;
    var gujaratiS = _journals1.isNotEmpty ? _journals1[a]['gujaratiS'] : 0;
    var gujaratiF = _journals1.isNotEmpty ? _journals1[a]['gujaratiF'] : 0;
    var Hindi = _journals1.isNotEmpty ? _journals1[a]['hindi'] : 0;
    var Computer = _journals1.isNotEmpty ? _journals1[a]['computer'] : 0;
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
            SizedBox(height: 20,),
            Text('If You are any changes in your result click here'),
//             SizedBox(height: 5,),
            SizedBox(height: 10,),
            InkWell(
                onTap: () {
                 // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CommerceTable(),));
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
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'Subject\n Code',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),
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
                    DataCell(Text('154', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('ELEMENTS OF ACC.', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${Acc}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('337', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('SEC.PRACTICE ', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${Sp}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('022', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('ECONOMICS', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${Eco}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('135', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('STATISTICS', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${State1}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('046', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('DRG.OF.COMMERCE', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${Ba}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('006', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('GUJARATI(SECOND LANGUAGE) (008)\n'
                        'ENGLISH(SECOND LANGUAGE) (013)', style: TextStyle(fontSize: 13, color: Colors.black))),
                   // DataCell(Text('ENGLISH(S.L)', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${gujaratiS}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('001', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.18,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('GUJRATI(FIRST LANGUAGE)  (001)', style: TextStyle(fontSize: 13, color: Colors.black)),
                              Text('HINDI(FIRST LANGUAGE) (002)', style: TextStyle(fontSize: 13, color: Colors.black)),
                              Text('MARATHI(FIRST LANGUAGE) (003)', style: TextStyle(fontSize: 13, color: Colors.black)),
                              Text('URDU(FIRST LANGUAGE) (004)', style: TextStyle(fontSize: 13, color: Colors.black)),
                              Text('SINDHI(FIRST LANGUAGE) (005)', style: TextStyle(fontSize: 13, color: Colors.black)),
                              Text('ENGLISH(FIRST LANGUAGE) (006)', style: TextStyle(fontSize: 13, color: Colors.black)),
                              Text('TAMIL (007)', style: TextStyle(fontSize: 13, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //DataCell(Text('GUJRATI(F.L)', style: TextStyle(fontSize: 15, color: Colors.black))),
                    DataCell(Text('${gujaratiF}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('009', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('HINDI(S.L)', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${Hindi}', style: TextStyle(fontSize: 13, color: Colors.black))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('331', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('COM.EDUCATION', style: TextStyle(fontSize: 13, color: Colors.black))),
                    DataCell(Text('${Computer}', style: TextStyle(fontSize: 13, color: Colors.black))),
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
