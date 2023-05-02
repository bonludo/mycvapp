import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/models/education.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';
import 'package:mycv/viewmodels/education_viewmodel.dart';
import 'package:mycv/widget/first_name_last_name_job.dart';
import 'package:mycv/widget/title_view_and_number.dart';

class EducationView extends StatelessWidget {
  final EducationViewModel _viewModel = EducationViewModel();

  EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    Size screenSize = MediaQuery.of(context).size;
    String title = 'Parcours';
    String number = '02';
    double leftNumber = screenSize.width * 0.35;
    return FutureBuilder(
      future: _viewModel.loadEducation(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            color: colorProvider.primaryColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TitleViewAndNumberWidget(
                        title: title,
                        number: number,
                        leftNumber: ScreenHelper.getWidthBasedOnScreenSize(
                            context, leftNumber, leftNumber, 235),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: const FirstNameLastNameJob()),
                    SizedBox(width: screenSize.width * 0.04),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _viewModel.educations.length,
                      itemBuilder: (context, index) {
                        Education education = _viewModel.educations[index];
                        return _buildEducation(
                            context,
                            education,
                            _viewModel.educationIcons[index],
                            index,
                            screenSize,
                            colorProvider);
                      }),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

Widget buildLogoEducation(int index, ColorProvider colorProvider) {
  final EducationViewModel viewModel = EducationViewModel();
  if (index == 0) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Wrap(
        children: [
          SvgPicture.asset(
            viewModel.logoEducation[0],
            color: colorProvider.primaryTextColor,
            height: 30, // set the height to a smaller value
            width: 30, // set the width to a smaller value
          ),
          const SizedBox(
            width: 5,
          ),
          // Image.asset(
          //   viewModel.logoEducation[1],
          //   color: Colors.white,
          //   height: 60, // set the height to a smaller value
          //   width: 100, // set the width to a smaller value
          // ),
        ],
      ),
    );
  } else {
    return SvgPicture.asset(
      viewModel.logoEducation[2],
      color: colorProvider.primaryTextColor,
      height: 100, // set the height to a smaller value
      width: 100, // set the width to a smaller value
    );
  }
}

Widget _buildEducation(BuildContext context, Education education, Icon icon,
    int index, Size screenSize, ColorProvider colorProvider) {
  return Padding(
    padding: const EdgeInsets.only(left: 35.0, top: 0, right: 25.0),
    child: Column(
      children: [
        if (screenSize.width >= 820) const SizedBox(height: 35),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// Column 1
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '${education.endYears}',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenHelper.getFontBasedOnScreenSize(
                          context, 18, 22, 22),
                      color: colorProvider.primaryTextColor),
                ),
                const SizedBox(height: 16),
                AutoSizeText(
                  '${education.startYears}',
                  style: GoogleFonts.poppins(
                      fontSize: ScreenHelper.getFontBasedOnScreenSize(
                          context, 10, 14, 14), color: colorProvider.textDate),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Column 2
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImage(colorProvider),
                const SizedBox(height: 8),
                Container(
                  width: 3,
                  height: screenSize.width < 600
                      ? screenSize.height / 2
                      : screenSize.height / 2,
                  color: colorProvider.primaryTextColor,
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Column 3
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name of the school and schoollevel
                  Wrap(
                    children: [
                      Text(
                        '${education.courseName} ',
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: ScreenHelper.getFontBasedOnScreenSize(
                              context, screenSize.width * 0.04, 22, 22),
                          fontWeight: FontWeight.bold,
                          color: colorProvider.primaryTextColor,
                        ),
                      ),
                      Text(
                        '- ${education.schoolLevel}',
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: ScreenHelper.getFontBasedOnScreenSize(
                              context, screenSize.width * 0.04, 22, 22),
                          fontWeight: FontWeight.bold,
                          color: colorProvider.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height >= 820 ? 100 : 20),
                  // Description de l'éducation
                  _buildDescription(
                      context, education, colorProvider, screenSize),
                  const SizedBox(height: 8),
                  if (screenSize.width >= 920)
                    Center(
                        child: Container(
                            child: buildLogoEducation(index, colorProvider))),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Container _buildDescription(BuildContext context, education,
    ColorProvider colorProvider, Size screenSize) {
  return Container(
    decoration: BoxDecoration(
      color: colorProvider.secondaryColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    constraints: const BoxConstraints(
      maxWidth: 450.0,
    ),
    padding: const EdgeInsets.all(8.0),
    child: Text(
      education.descriptionOfStudy,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: ScreenHelper.getFontBasedOnScreenSize(
            context, screenSize.width * 0.035, 20, 20),
        color: colorProvider.primaryTextColor,
      ),
    ),
  );
}

Container _buildImage(ColorProvider colorProvider) {
  return Container(
    width: 56,
    height: 56,
    child: Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorProvider.primaryTextColor,
        ),
      ),
      Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorProvider.primaryColor,
          ),
          child: Icon(
            Icons.school, // Icône pour l'éducation
            color: colorProvider.primaryTextColor,
          ),
        ),
      ),
    ]),
  );
}
