
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:GSEB_Schedule/View/select_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';

class StudentDetails extends StatefulWidget {
  
  var mob;StudentDetails({
    Key? key,
    required this.mob
  }) : super(key: key);

  @override
  State<StudentDetails> createState() => StudentDetailsState(mob);
}

class StudentDetailsState extends State<StudentDetails> {
  TextEditingController _Name = TextEditingController();
  TextEditingController _SchoolName = TextEditingController();
  TextEditingController _MobileNumber = TextEditingController();
  var form1 = GlobalKey<FormState>();
  var mob;
  StudentDetailsState(this.mob);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form1,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      color: Color(0xFF054A97),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: MediaQuery.of(context).size.height*0.5,
                    left: MediaQuery.of(context).size.width*0.24,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: AssetImage("assets/studpagelogo.png"),
                      ),
                    ),
                  )
                ],
              ),
                SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: _Name,
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return  'enter the value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF054A97), // Fix: Add 0xFF before color code
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    hintText: "Student Name",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF054A97),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: _SchoolName,
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return  'enter the value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF054A97), // Fix: Add 0xFF before color code
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    hintText: "School Name",
                    prefixIcon: Icon(
                      Icons.school,
                      color: Color(0xFF054A97),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () async {
                    if (form1.currentState!.validate()) {
                      // Form is valid, proceed to save data
                      Map<String, dynamic> dataToSave = {
                        'Name': _Name.text,
                        'SchoolName': _SchoolName.text,
                        'Mobilenum': mob
                      };
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setBool(SplashScreenState.Studentdeatil, true);
                      try {
                        // Save data to Firestore
                        await FirebaseFirestore.instance.collection('Users').add(dataToSave);
                        // Navigate to the next screen or perform any other actions
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectClass()),
                        );
                      } catch (e) {
                        print('Error saving data to Firestore: $e');
                        // Handle error appropriately
                      }
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
            ],
          ),
        ),
      ),
    );
  }
}


