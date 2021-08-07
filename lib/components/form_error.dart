import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.error,
  }) : super(key: key);

  final List<String> error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(error.length, (index) => formErrorText(error[index])),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 14,
          width: 14,
        ),
        SizedBox(
          width: 10,
        ),
        Text(error)
      ],
    );
  }
}
