import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/otp/components/otp_form.dart';

import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
            ),
            Text(
              "OTP verification",
              style: headlineStyle,
            ),
            Text('We sent your code to +237 67301****'),
            buildTimer(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.15,
            ),
            OtpForm(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.1,
            ),
            GestureDetector(
              onTap: () {
                print("Resend code");
              },
              child: Text(
                'Resend OTP code',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expire in '),
        TweenAnimationBuilder(
            tween: Tween(begin: 30.0, end: 0),
            duration: Duration(seconds: 30),
            builder: (context, value, child) => Text(
                  '00:$value',
                  style: TextStyle(color: KPrimaryColor),
                ))
      ],
    );
  }
}
