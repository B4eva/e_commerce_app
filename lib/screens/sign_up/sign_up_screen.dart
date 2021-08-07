import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static final routName = '/signUp-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Sign Up')), body: Body());
  }
}
