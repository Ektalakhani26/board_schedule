// import 'dart:async';
//
// import 'package:board_exam/View/signup_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }
//
//
// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children:[
//           Container(
//             color: Color(0xFF054A97),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: SizedBox(
//                     height: 300,
//                     width: 300,
//                     child: Image(image: AssetImage("assets/SSCLogo.png"))),
//               ),
//             ],
//           ),
//
//         ]
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:GSEB_Schedule/View/Science/science_result.dart';
import 'package:GSEB_Schedule/View/student_details.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Arts/arts_result.dart';
import 'Commerce/commerce_result.dart';
import 'SSC_Result/sss_result.dart';
import 'select_class.dart';
import 'select_stream.dart';
import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String mobileauth = "MobileAuth";
  static const String Studentdeatil = "StudentDetail";
  static const String selectclass = "SelectClass";
  static const String selectstream = "SelectStream";


  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("Token");
      print(token!);
    });
    super.initState();
    saved();
  }
  void saved() async {
    SharedPreferences pref1 = await SharedPreferences.getInstance();
    SharedPreferences pref = await SharedPreferences.getInstance();
    SharedPreferences pref2 = await SharedPreferences.getInstance();
    SharedPreferences pref3 = await SharedPreferences.getInstance();
    var MobileAut = pref.getBool(mobileauth);
    var StudentDet = pref1.getBool(Studentdeatil);
    var Selectclass = pref2.getString(selectclass);
    var SelectStream = pref3.getString(selectstream);

    if( MobileAut != null && StudentDet != null && Selectclass!=null){

      if(MobileAut && StudentDet){
        if(Selectclass == '10'){
        Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SSCResult.note())),);
      }
      else if(Selectclass == '12'){
        if(SelectStream == 'Science') {
          Timer(Duration(seconds: 1), () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Science_Result.note())),);
        }
        else if(SelectStream == 'Commarce') {
          Timer(Duration(seconds: 1), () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CommerceResult.note())),);
        }
        else if(SelectStream == 'Arts') {
          Timer(Duration(seconds: 1), () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ArtsResult.note())),);
        }
      }
      else {
          Timer(Duration(seconds: 1), () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SelectClass())),);
        }
      }
      else if(MobileAut){
        Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StudentDetails(mob: ''))),);
      }
      else{
        Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpScreen())),);
      }
    }

    else{
      Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpScreen())),);
    }
  }
  // void saved() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var LogIn =pref.getBool(login);
  //   if(LogIn != null){
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF054A97),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image(image: AssetImage("assets/SSCLogo.png")),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20, // Adjust the bottom distance as needed
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF60C476)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
