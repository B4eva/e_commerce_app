import 'package:e_commerce_app/screens/home/components/catergories.dart';
import 'package:e_commerce_app/screens/home/components/dicount_banner.dart';
import 'package:e_commerce_app/screens/home/components/home_header.dart';
import 'package:e_commerce_app/screens/home/components/popular_products.dart';

import 'package:e_commerce_app/screens/home/components/special_offer.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        HomeHeader(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        DiscountBanner(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Categories(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        SpecialOffers(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        SizedBox(height: 20),
        PopularProducts(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
      ],
    )));
  }
}
