import 'package:flutter/material.dart';

import '../../constant.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Size size;
  final Function() onPressed;
  const ButtonWidget({required this.text, required this.onPressed, Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = size.height * 0.03;

    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius), gradient: LinearGradient(colors: [mainColor, mainColor])),
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(EdgeInsets.only(
                  right: size.height * 0.16, left: size.height * 0.16, top: size.height * 0.01, bottom: size.height * 0.01)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: secondColor, fontSize: 16),
          ),
        ));
  }
}
