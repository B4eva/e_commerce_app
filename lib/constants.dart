import 'package:flutter/material.dart';

const KPrimaryColor = Color(0xFFFF7643);
const KPrimaryLightColor = Color(0xFFFFECDF);
const KPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);

const KSecondryColor = Color(0xFF979797);
const KTextColor = Color(0xFF757575);

const KAnimationDuration = Duration(milliseconds: 200);

final headlineStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String KNameNullError = "Please Enter your name";
const String KPhoneNumberNullError = "Please Enter your phone number";
const String KAddressNullError = "Please Enter you address";

final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder());

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: KTextColor));
}
