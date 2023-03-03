import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.restart_alt,
                      color: kBlueColour,
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.close,
                      color: kYellowColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Player A Name: 0',
                    style: GoogleFonts.nunito(color: kGreenColor, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Player B Name: 0",
                    style: GoogleFonts.nunito(color: kRedColor, fontSize: 17),
                  )
                ],
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(10)),
                );
              },
              itemCount: 9,
            )
          ],
        ),
      ),
    );
  }
}
