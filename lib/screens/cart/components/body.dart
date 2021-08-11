import 'package:e_commerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: demoCart.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Dismissible(
            key: Key(demoCart[index].product!.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(
                    0xFFFFE6E6,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset('assets/icons/Trash.svg')
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                demoCart.removeAt(index);
              });
            },
            child: CartItemCard(
              cart: demoCart[index],
            ),
          ),
        ),
      ),
    );
  }
}
