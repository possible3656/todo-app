import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../data/res/color_res.dart';

class TitleTextFieldView extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  const TitleTextFieldView(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorRes.secodaryText,
            fontSize: 14,
            letterSpacing: 1.1,
          ),
        ),
        TextField(
          controller: controller,
          style: TextStyle(
            color: ColorRes.primaryText,
            fontSize: 22,
            letterSpacing: 1.1,
          ),
          cursorColor: ColorRes.secodaryText,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorRes.secodaryText),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorRes.secodaryText),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: 14, color: ColorRes.secodaryText.withOpacity(.5))),
        ),
      ],
    );
  }
}
