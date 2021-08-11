import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/rounded_icon_button.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static final routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: RoundedIconBtn(
          iconData: Icons.arrow_back_ios,
          press: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Column(
        children: [
          Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCart.length} items",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      // we use this hight just for demo
      // height: 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15))
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset('assets/icons/receipt.svg'),
                ),
                Spacer(),
                Text('Add Voucher code'),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: KTextColor,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(text: "Total\n", children: [
                  TextSpan(
                      text: '\CFA 339.15',
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ])),
                SizedBox(
                  width: 190,
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
