import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final Function() onPressed;
  final Size size;
  final String imagePath;
  final String buttonText;
  const SocialButton({
    required this.onPressed,
    Key? key,
    required this.size,
    required this.imagePath,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.white;
    Color borderColor = Color(0xffE8E8E8);

    return Container(
        height: size.height * 0.05,
        width: size.width * 0.6,
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.03),
          color: buttonColor,
          border: Border.all(color: borderColor),
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.height * 0.03)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imagePath,
                width: 20,
              ),
              SizedBox(
                width: size.height * 0.015,
              ),
              Text(buttonText,
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black.withOpacity(0.7), fontSize: size.height * 0.018, fontWeight: FontWeight.bold)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}
