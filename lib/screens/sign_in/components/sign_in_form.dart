import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/outils/user_simple_preference.dart';
import 'package:e_commerce_app/screens/Login_success/login_success_screen.dart';
import 'package:e_commerce_app/screens/forgot_Password/forgot_password_screen.dart';
import 'package:flutter/material.dart';

import './/components/default_button.dart';
import './/constants.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String? email;
  String? password;
  bool? remember = false;

  void initStatee() {
    super.initState();

    email = UserSimplePreference.getUserEmail() ?? '';
  }

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
            buidEmailFormField(),
            SizedBox(height: 20),
            buildPasswordFormField(),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Checkbox(
                  activeColor: KPrimaryColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text("Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
              ],
            ),
            FormError(error: errors),
            SizedBox(
              height: 30,
            ),
            DefaultButton(
                text: 'continue',
                press: () async {
                  await UserSimplePreference.setUserEmail(email.toString());

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                }),
          ],
        ));
  }

  TextFormField buidEmailFormField() {
    return TextFormField(
        initialValue: email,
        onSaved: (newValue) {
          email = newValue;
        },
        onChanged: (email) {
          if (email.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(email)) {
            removeError(error: kInvalidEmailError);
          }
          setState(() {
            this.email = email;
          });
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kEmailNullError);
            return '';
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            addError(error: kInvalidEmailError);
            return '';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Enter your email",
            labelText: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")));
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
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return '';
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return '';
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
}
