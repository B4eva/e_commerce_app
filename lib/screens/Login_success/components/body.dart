import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: SizeConfig.screenHeight! * 0.01,
      ),
      Image.asset(
        'assets/images/success.png',
        height: SizeConfig.screenHeight! * 0.5,
      ),
      SizedBox(
        height: SizeConfig.screenHeight! * 0.01,
      ),
      Text(
        "Login Success",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      Spacer(),
      SizedBox(
        width: SizeConfig.screenWidth! * 0.6,
        child: DefaultButton(
          press: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
          text: 'Back to home',
        ),
      ),
      Spacer()
    ]);
  }
}
