import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../components/splash_content.dart';
import '../../../components/default_button.dart.';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to Nwacudo. Shop Now!',
      'image': 'assets/images/splash_1.png'
    },
    {
      'text':
          'We help people connect with store \n around South West of Cameroon!',
      'image': 'assets/images/splash_2.png'
    },
    {
      'text': 'We show the easy way to shop. \nJust stay at home with us!',
      'image': 'assets/images/splash_3.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                        text: splashData[index]['text'].toString(),
                        image: splashData[index]['image'].toString(),
                      )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buidDot(index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      text: 'Continue',
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buidDot(int index) {
    return AnimatedContainer(
      duration: KAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? KPrimaryColor : Color(0xFFD8D821),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
