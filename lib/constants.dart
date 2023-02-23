import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kBlueColour = const Color(0xFF4285f4);
Color kGreenColor = const Color(0xFF33a853);
Color kRedColor = const Color(0xFFe94234);
Color kYellowColor = const Color(0xFFfabc01);

class ColorConstants{
  static List<Color> colourList = [kBlueColour, kGreenColor, kRedColor, kYellowColor];

  void randomiseTheme(){
    colourList.shuffle();
  }
}

getSnackBar(String text, BuildContext context) {
  var snackBar = SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.grey,
    duration: const Duration(seconds: 5),
    content: SizedBox(
        height: 25,
        child: Center(
            child: Text(
              text,
              style: GoogleFonts.nunito(color: Colors.black, fontSize: 20),
            ))),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}