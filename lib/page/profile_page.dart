import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String firstName = "Afiq Harith";
  String lastName = "harzaki";
  String username = "AfiqHarith";
  String email = "afiqharith@example.com";
  String gender = "Male";
  String dob = "20/04/1999";
  String profilePictureUrl = "https://example.com/profile_picture.png";
  bool _editingEnable = false;
  bool _savingChanges = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    usernameController.text = username;
    emailController.text = email;
    genderController.text = gender;
    dobController.text = dob;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.aBeeZee(
            fontSize: 16.sp,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _editingEnable = true;
              });
            },
            icon: Icon(Icons.edit),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.delete_forever),
          // )
        ],
      ),
      body: Container(
        width: 100.w,
        height: 80.h,
        margin: kMargin,
        padding: kPadding,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: kRadius,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SizedBox(
              //   height: 10.0,
              // ),
              CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(profilePictureUrl),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                controller: firstNameController,
                enabled: _editingEnable,
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Last Name",
                  labelStyle: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                controller: lastNameController,
                enabled: _editingEnable,
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                controller: usernameController,
                enabled: _editingEnable,
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                controller: emailController,
                enabled: _editingEnable,
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Gender",
                  labelStyle: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                controller: genderController,
                enabled: _editingEnable,
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                controller: dobController,
                enabled: _editingEnable,
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _editingEnable
                    ? () async {
                        setState(() {
                          _savingChanges = true;
                        });
                        await Future.delayed(
                          Duration(seconds: 2),
                        );
                        setState(() {
                          _editingEnable = false;
                          _savingChanges = false;
                        });
                      }
                    : null,
                child: _savingChanges
                    ? CircularProgressIndicator()
                    : Text(
                        "Save Changes",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 12.sp,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
