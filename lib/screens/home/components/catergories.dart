import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> catergories = [
      {'icon': "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {'icon': "assets/icons/Bill Icon.svg", "text": "Bill"},
      {'icon': "assets/icons/Game Icon.svg", "text": "Game"},
      {'icon': "assets/icons/Gift Icon.svg", "text": "Gift"},
      {'icon': "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {'icon': "assets/icons/Discover.svg", "text": "More"}
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              catergories.length,
              (index) => CatergoryCard(
                    icon: catergories[index]['icon'],
                    text: catergories[index]['text'],
                    press: () {},
                  ))
        ],
      ),
    );
  }
}

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({
    Key? key,
    this.icon,
    this.text,
    this.press,
  }) : super(key: key);

  final String? icon, text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(icon!),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
