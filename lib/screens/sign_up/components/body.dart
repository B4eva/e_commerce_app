import 'package:e_commerce_app/components/social_card.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! / 20),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.07,
            ),
            Text('Register Account', style: headlineStyle),
            Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.07,
            ),
            SignUpForm(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: 'assets/icons/google-icon.svg',
                  press: () {},
                ),
                SocialCard(
                  icon: 'assets/icons/facebook-2.svg',
                  press: () {},
                ),
                SocialCard(
                  icon: 'assets/icons/twitter.svg',
                  press: () {},
                )
              ],
            ),
            SizedBox(
              height: (SizeConfig.screenHeight! / 812) * 20,
            ),
            Text(
              "By continuing you confirm that you agree \nwith our Terms and condition",
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
