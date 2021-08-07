import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! / 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Text(
                "Complete Profile",
                style: headlineStyle,
              ),
              Text(
                "Complete your details or contine \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              CompleteProfileForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              Text(
                "By continuing, you confirm that you agree \nwith our Term and condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
