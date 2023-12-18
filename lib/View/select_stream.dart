
import 'package:GSEB_Schedule/View/Arts/arts_table.dart';
import 'package:GSEB_Schedule/View/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Commerce/commerce_table.dart';
import 'Science/science_table.dart';

class SelectStream extends StatefulWidget {
  const SelectStream({super.key});

  @override
  State<SelectStream> createState() => SelectStreamState();
}

class SelectStreamState extends State<SelectStream> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
            child: Row(
              children: [
                Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width * 0.45,
                  color: Color(0xFF60C476),
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Text("60%"),
              ],
            ),
          ),
          SizedBox(height: 150,),
          Text(
            'Select Your Stream',
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString(SplashScreenState.selectstream, 'Science');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScienceTable()));
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(width: 1, color: Colors.black),
                  ),
                 leading:  Container(
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
                  title:   Text(
                    'Science',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF054A97),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString(SplashScreenState.selectstream, 'Commarce');
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommerceTable(),));
              },
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(width: 1, color: Colors.black),
                ),
                leading:  Container(
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
                title:   Text(
                  'Commerse',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF054A97),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString(SplashScreenState.selectstream, 'Arts');
              Navigator.push(context, MaterialPageRoute(builder: (context) => ArtsTable(),));
            },
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(width: 1, color: Colors.black),
                ),
                leading:  Container(
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
                title:   Text(
                  'Arts',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF054A97),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
