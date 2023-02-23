import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/screens/grid_screen.dart';

import '../constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    String? playerAName;
    String? playerBName;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            ColorConstants().randomiseTheme();
                            setState(() {});
                          },
                          child: Icon(
                            Icons.color_lens_outlined,
                            color: ColorConstants.colourList[2],
                          ))
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 210, bottom: 40),
                    child: Text(
                      "Tic-Tac-Toe",
                      style: GoogleFonts.nunito(
                          fontSize: 60, color: ColorConstants.colourList[0]),
                    )),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    cursorColor: ColorConstants.colourList[1],
                    style:
                        GoogleFonts.nunito(color: ColorConstants.colourList[1], fontSize: 15),
                    decoration: InputDecoration(
                        labelStyle: GoogleFonts.nunito(
                            color: ColorConstants.colourList[1]),
                        labelText: "Player A Name",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: ColorConstants.colourList[1])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: ColorConstants.colourList[1]))),
                    onChanged: (value) {
                      playerAName = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    cursorColor: ColorConstants.colourList[2],
                    style:
                        GoogleFonts.nunito(color: ColorConstants.colourList[2], fontSize: 15),
                    decoration: InputDecoration(
                        labelStyle: GoogleFonts.nunito(
                            color: ColorConstants.colourList[2]),
                        labelText: "Player B Name",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: ColorConstants.colourList[2])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: ColorConstants.colourList[2]))),
                    onChanged: (value) {
                      playerBName = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.colourList[0],
                    ),
                    onPressed: () {
                      if (playerAName != null && playerBName != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GridScreen(
                                      playerAName: playerAName!,
                                      playerBName: playerBName!,
                                    )));
                      } else {
                        getSnackBar("Please enter both the fields", context);
                      }
                    },
                    child: Text(
                      "Start",
                      style: GoogleFonts.nunito(
                          fontSize: 20, color: ColorConstants.colourList[3]),
                    ))
              ],
            ),
          ),
        ));
  }
}
