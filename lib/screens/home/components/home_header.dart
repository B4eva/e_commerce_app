import 'package:e_commerce_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:e_commerce_app/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconButtonWithCounter(
            svgScr: 'assets/icons/Cart Icon.svg',
            numOfItems: 0,
            press: () {},
          ),
          IconButtonWithCounter(
            svgScr: 'assets/icons/Bell.svg',
            numOfItems: 2,
            press: () {},
          ),
        ],
      ),
    );
  }
}
