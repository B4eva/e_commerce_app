import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    @required this.iconData,
    @required this.press,
  }) : super(key: key);
  final IconData? iconData;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.zero,
        child: Center(
          child: TextButton(
            child: Icon(
              iconData,
              color: Colors.black,
            ),
            onPressed: press,
          ),
        ),
      ),
    );
  }
}
