import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';

class TitleViewAndNumberWidget extends StatelessWidget {
  const TitleViewAndNumberWidget({
    super.key,
    required this.title,
    required this.number,
    required this.leftNumber,
  });

  final String title;
  final String number;
  final double leftNumber;

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // topText: screenHeight * 0.06
    double topPadding = screenHeight * 0.06;
    double leftPadding = screenWidth * 0.06;

    return Stack(
      children: [
          Padding(
            padding: EdgeInsets.only(left: ScreenHelper.getWidthBasedOnScreenSize(context,leftPadding+leftNumber,leftPadding+leftNumber, leftNumber),top: 0), // left padding de number dépendant du left padding du title
            child: Text(
              number,
              style: GoogleFonts.poppins(
                  fontSize: ScreenHelper.getFontBasedOnScreenSize(context, screenWidth * 0.17,screenWidth * 0.17, 80),
                  color: colorProvider.textNumber,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        // ),
        Padding(
          padding: EdgeInsets.only(left: ScreenHelper.getWidthBasedOnScreenSize(context,leftPadding,leftPadding, 35) , top: 32 ),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              color: colorProvider.primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: ScreenHelper.getFontBasedOnScreenSize(context, screenWidth * 0.09,screenWidth * 0.09, 50),
            ),
            maxLines: 1,
          ),
        ),
      ],
    );  }
}

