import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNUmber;
  String? address;

  void addError({required String error}) {
    if (!error.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (error.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildFirstNameFormField(),
        SizedBox(
          height: SizeConfig.screenHeight! / 40,
        ),
        buildLastNameFormField(),
        SizedBox(
          height: SizeConfig.screenHeight! / 40,
        ),
        buildPhoneNumberFormField(),
        SizedBox(
          height: SizeConfig.screenHeight! / 40,
        ),
        buildAddressFormField(),
        FormError(error: errors),
        SizedBox(
          height: SizeConfig.screenHeight! / 40,
        ),
        DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
                // Go to OTP page
              }
            })
      ]),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
        onSaved: (newValue) {
          address = newValue;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: KAddressNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: KAddressNullError);
            return '';
          }
          return null;
        },
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
            hintText: "Enter your address",
            labelText: 'Address',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix:
                CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg")));
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
        onSaved: (newValue) => phoneNUmber = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: KPhoneNumberNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: KPhoneNumberNullError);
            return '';
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: "Enter your phone number",
            labelText: 'Phone Number',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg")));
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
        onSaved: (newValue) {
          lastName = newValue;
        },
        decoration: InputDecoration(
            hintText: "Enter your Last name",
            labelText: 'Last Name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")));
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
        onSaved: (newValue) {
          firstName = newValue;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: KNameNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: KNameNullError);
            return '';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "Enter your first name",
            labelText: 'First Name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")));
  }
}
