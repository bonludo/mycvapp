import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';

class FirstNameLastNameJob extends StatelessWidget {

  const FirstNameLastNameJob({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
//---------- FIRST NAME ---------
        Baseline(
          baseline: 30,
          baselineType: TextBaseline.alphabetic,
          child: AutoSizeText(
            'Ludovic',
            maxLines: 1,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: colorProvider.primaryTextColor,
              fontSize: ScreenHelper.getFontBasedOnScreenSize(context,20,20, 25),
              height: 1,
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        AutoSizeText(
          'bonbon'.toUpperCase(),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: colorProvider.primaryTextColor,
            fontSize: ScreenHelper.getFontBasedOnScreenSize(context,14,14, 20),
            height: 1,
          ),
          maxLines: 1,
        ),
        const SizedBox(width: 8),

        //---------- JOB SEARCH ----------
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: colorProvider.primaryTextColor,
            ),
            child: AutoSizeText(
              'Développeur',
              maxLines: 1,
              style: GoogleFonts.poppins(
                  fontSize: ScreenHelper.getFontBasedOnScreenSize(context,11,11, 16),
                  fontWeight: FontWeight.bold,
                  color: colorProvider.primaryColor),
            )),
      ],
    );
  }
}
