import 'package:e_commerce_app/components/rounded_icon_button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, this.rating = 4.6}) : super(key: key);
  static final routeName = "/details";
  final double? rating;

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments? arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments?;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Text(
                    arguments!.product.rating.toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset('assets/icons/Star Icon.svg')
                ],
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        //our default appBar don't have enough space
        // so lets create our own CustomAppBar
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: RoundedIconBtn(
            iconData: Icons.arrow_back_ios,
            press: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Body(product: arguments.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}




// class CustomAppBar extends PreferredSize {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         RoundedIconBtn(
//             iconData: Icons.arrow_back_ios, press: () => Navigator.pop(context))
//       ],
//     );
//   }
// }

// mixin CustomAppBar implements PreferredSize {
//   @override

//   //Appbar().preferredSize.heigh provide us the height that apply on our app bar
//   Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

//   @override
//   Widget build(BuildContext context) {
//     return Row();
//   }
// }

// We also need to pass our product to our details screen
// And we use name route so we need to create a arguments class

