import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:GSEB_Schedule/View/student_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  Country? _selectedCountry;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  String verificationId = '';

  Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      _auth.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone verification failed: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verificationId, [int? forceResendingToken]) {
      this.verificationId = verificationId;
      print('Please check your phone for the verification code.');
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    String phoneNumber = '+${_selectedCountry?.callingCode}${_phoneNumberController.text}'; // Ensure you add a "+" at the beginning.

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }


  Future<void> verifyOTP(String otp) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      await _auth.setSettings(appVerificationDisabledForTesting: true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => StudentDetails(mob: _phoneNumberController.text), // Replace with your home screen widget
        ),
      );
    } catch (e) {
      print('Error verifying OTP: $e');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCountry();
  }
  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onPressed() async {
    final country = await Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return PickerPage();
    }));
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
  var form1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form1,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  // Blue color code
                  color: const Color(0xFF054A97),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.15,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.31,
                  left: MediaQuery.of(context).size.width * 0.15,
                  child: const Text(
                    'Enter Your Credentials to Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB1AAAA),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: MediaQuery.of(context).size.width * 0.5 - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.person, size: 70, color: Color(0xFF054A97)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.58,
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  child: Container(
                    child:Row(
                      children: [
                        InkWell(
                          onTap: _onPressed,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.16,
                            width: MediaQuery.of(context).size.width * 0.15,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 2),)),
                            child: Text(
                              textAlign: TextAlign.center,
                              '(${_selectedCountry?.callingCode ?? ""})',
                              style: TextStyle(fontSize: 15,color:Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              var mno=value;
                              if(mno==null || mno.isEmpty){
                                return 'enter the value';
                              }
                              else if(mno.length != 10){
                                return 'please enter 10 digit';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white,fontSize: 17),
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                              focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green, width: 2),
                                          ),
                              enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green, width: 2),
                                          ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.73,
                  left: MediaQuery.of(context).size.width * 0.3, // Adjusted left to center the button
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () async {
                        //final mob = _phoneNumberController.text;
                        setState(() {

                        });
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setBool(SplashScreenState.mobileauth, true);
                        // Handle the button press
                        verifyPhone();
                        _settingModalBottomSheet(context);
                         //Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen(),));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Background color
                        onPrimary: Color(0xFF054A97), // Text color
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _settingModalBottomSheet(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      isScrollControlled:true,
      builder: (BuildContext bc) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: OtpTextField(
                    numberOfFields: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    borderColor: Color(0xFF054A97),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      // Handle validation or checks here
                    },
                    onSubmit: (String verificationCode) {
                      verifyOTP(verificationCode);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Check For SMS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Message to get verification code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB1AAAA),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {

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
                    child: Text("Verify", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class PickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Country'),
      ),
      body: Container(
        child: CountryPickerWidget(
          onSelected: (country) => Navigator.pop(context, country),
        ),
      ),
    );
  }
}
