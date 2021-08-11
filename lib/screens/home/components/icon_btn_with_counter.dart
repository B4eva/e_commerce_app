import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class IconButtonWithCounter extends StatelessWidget {
  const IconButtonWithCounter({
    Key? key,
    @required this.svgScr,
    this.numOfItems = 0,
    @required this.press,
  }) : super(key: key);
  final String? svgScr;
  final int numOfItems;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.height / 14,
            decoration: BoxDecoration(
                color: KSecondryColor.withOpacity(0.1), shape: BoxShape.circle),
            child: SvgPicture.asset(svgScr!),
          ),
          if (numOfItems != 0)
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: Color(0xFFFF4848),
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 1.5,
                        color: Colors.white,
                        style: BorderStyle.solid)),
                child: Center(
                    child: Text(
                  '$numOfItems',
                  style: TextStyle(
                      color: Colors.white,
                      height: 1,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                )),
              ),
            )
        ],
      ),
    );
  }
}
