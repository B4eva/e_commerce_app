import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return ProductImages(product: product);
  }
}

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            width: 238,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(widget.product!.images![0]),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product!.images!.length,
                (index) => buildSmallPreview(index))
          ],
        )
      ],
    );
  }

  Container buildSmallPreview(int index) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(8),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KPrimaryColor)),
      child: Image.asset(widget.product!.images![index]),
    );
  }
}
