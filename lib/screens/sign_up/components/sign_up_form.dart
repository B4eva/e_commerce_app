import 'package:e_commerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import './/components/custom_suffix_icon.dart';
import './/components/form_error.dart';
import './/components/default_button.dart';
import './/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirm_password;
  final List<String> errors = [];

  void addError({required String error}) {
    return setState(() {
      errors.add(error);
    });
  }

  void removeError({required String error}) {
    return setState(() {
      errors.remove(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: SizeConfig.screenHeight! / 25,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: SizeConfig.screenHeight! / 25,
          ),
          buildConfirmPasswordField(),
          SizedBox(
            height: SizeConfig.screenHeight! / 20,
          ),
          FormError(error: errors),
          DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  // Go to complete profile page

                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              })
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
        onSaved: (newValue) => confirm_password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.isNotEmpty && password == confirm_password) {
            removeError(error: kMatchPassError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          } else if (password != value) {
            addError(error: kMatchPassError);
            return '';
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: "Re-enter your password",
            labelText: 'Confirm password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          }

          password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return '';
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: "Enter your password",
            labelText: 'Password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        onSaved: (newValue) {
          email = newValue;
        },
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            removeError(error: kInvalidEmailError);
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            addError(error: kEmailNullError);
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            addError(error: kInvalidEmailError);
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Enter your email",
            labelText: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")));
  }
}
