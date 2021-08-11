import 'package:e_commerce_app/screens/profile/components/profile_picture.dart';

import 'package:flutter/material.dart';

import 'profile_menu.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/icons/User Icon.svg',
            press: () {},
            text: 'My Account',
          ),
          ProfileMenu(
            icon: 'assets/icons/Bell.svg',
            press: () {},
            text: 'Notification',
          ),
          ProfileMenu(
            icon: 'assets/icons/Settings.svg',
            press: () {},
            text: 'Settings',
          ),
          ProfileMenu(
            icon: 'assets/icons/User Icon.svg',
            press: () {},
            text: 'Help Center',
          ),
          ProfileMenu(
            icon: 'assets/icons/Log out.svg',
            press: () {},
            text: 'Log Out',
          ),
        ],
      ),
    );
  }
}
