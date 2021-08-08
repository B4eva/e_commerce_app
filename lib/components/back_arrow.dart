import 'package:flutter/material.dart';

class CustomAppBAr extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight((AppBar().preferredSize.height));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row();
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
