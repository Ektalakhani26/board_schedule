
import 'package:GSEB_Schedule/View/select_stream.dart';
import 'package:GSEB_Schedule/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SSC_Result/ssc_table.dart';
import 'SSC_Result/sss_result.dart';

class SelectClass extends StatefulWidget {
  const SelectClass({Key? key}) : super(key: key);

  @override
  State<SelectClass> createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  @override
  Widget build(BuildContext context) {
    var std = '';
  //  var std2 = '12';
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
            child: Row(
              children: [
                Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Color(0xFF60C476),
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                 Text("30%"),
              ],
            ),
          ),
          SizedBox(height: 150,),
          Text(
            'Select Your Class',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 25,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(30),
            child: InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString(SplashScreenState.selectclass, '10');
                Navigator.push(context, MaterialPageRoute(builder:  (context) => SSCTable(),));
              },
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  side: BorderSide(width: 1, color: Colors.black),
                ),
                leading: Container(
                  height: 40,
                  width: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Color(0xFF054A97),
                   ),
                  child:  Center(
                    child: Text(
                      '10',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                title:   Text(
                  '10TH',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF054A97),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                trailing: Container(
                  width: 40,
                  child: CheckboxListTile(
                    checkboxShape: StadiumBorder(
                      side: BorderSide(width: 2)
                    ),
                    activeColor: Colors.black,
                    value: true, // Replace this with your actual value or a boolean variable
                    onChanged: (bool? value) {
                      // Handle checkbox value change here
                    },
                  ),
                ),

              ),
            )

          ),
          //SizedBox(height: 30,),
          Padding(
              padding: const EdgeInsets.fromLTRB(30,15,30,0),
              child: InkWell(
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString(SplashScreenState.selectclass, '12');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectStream(),));
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(width: 1, color: Colors.black),
                  ),
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF054A97),
                    ),
                    child:  Center(
                      child: Text(
                        '12',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  title:   Text(
                    '12TH',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF054A97),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  trailing: Container(
                    width: 40,
                    child: CheckboxListTile(
                      checkboxShape: StadiumBorder(
                          side: BorderSide(width: 2)
                      ),
                      activeColor: Colors.black,
                      value: true, // Replace this with your actual value or a boolean variable
                      onChanged: (bool? value) {
                        // Handle checkbox value change here
                      },
                    ),
                  ),
                ),
              ),
          ),
         // SizedBox(height: 70,),
          /*Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectStream()),
                );
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
              child: Text("Next", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),*/

        ],
      ),
    );
  }
}
