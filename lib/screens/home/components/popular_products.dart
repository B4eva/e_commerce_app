import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/details/details_screen.dart';
import 'package:e_commerce_app/screens/home/components/product_card.dart';
import 'package:e_commerce_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Products",
          press: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular!)
                    return ProductCard(
                      product: demoProducts[index],
                      press: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                              product: demoProducts[index],
                            ));
                      },
                    );
                  return SizedBox.shrink();
                },
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
