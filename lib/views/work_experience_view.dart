import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/models/work_experience.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';
import 'package:mycv/viewmodels/work_experience_viewmodel.dart';
import 'package:mycv/widget/first_name_last_name_job.dart';
import 'package:mycv/widget/title_view_and_number.dart';

class WorkExperienceView extends StatelessWidget {
  final WorkExperienceViewModel _viewModel = WorkExperienceViewModel();

  WorkExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    Size screenSize = MediaQuery.of(context).size;
    String title = 'Expérience';
    String number = '03';
    double leftNumber = screenSize.width * 0.38;
    return FutureBuilder(
      future: _viewModel.loadWorkExperiences(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Container(
              color: colorProvider.primaryColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TitleViewAndNumberWidget(
                          title: title,
                          number: number,
                          leftNumber: ScreenHelper.getWidthBasedOnScreenSize(context,leftNumber,leftNumber, 260),
                        ),
                      ),
                      if(screenSize.width >= 950)
                      Container(
                          alignment: Alignment.bottomRight,
                          child: const FirstNameLastNameJob()),
                      SizedBox(width: screenSize.width * 0.04),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _viewModel.workExperiences.length,
                        itemBuilder: (context, index) {
                          WorkExperience workExperience =
                              _viewModel.workExperiences[index];
                          return _buildWorkExperience(context,
                              workExperience,
                              _viewModel.workImages[index],
                              screenSize,
                              colorProvider);
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

Widget _buildWorkExperience(BuildContext context,WorkExperience workExperience, String imageAsset,
    Size screenSize, ColorProvider colorProvider) {
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
                Text(
                  '${workExperience.endYears}',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenHelper.getFontBasedOnScreenSize(
                          context, 18, 22, 22),
                      color: colorProvider.primaryTextColor),
                ),
                const SizedBox(height: 16),
                Text(
                  '${workExperience.startYears}',
                  style: GoogleFonts.poppins(fontSize:ScreenHelper.getFontBasedOnScreenSize(
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
                _buildImage(imageAsset, colorProvider),
                const SizedBox(height: 8),
                Container(
                  width: 3,
                  height: screenSize.width < 600
                      ? screenSize.height / 3
                      : screenSize.height / 3,
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
                  //Nom des job avec l'employer
                  Wrap(
                    children: [
                      _buildJobName(context, workExperience.jobName,colorProvider,screenSize),
                      const SizedBox(width: 8),
                      Text(
                        'chez ${workExperience.employer}',
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
                  //Description du job
                  _buildDescription(context, workExperience.descriptionExperience,colorProvider,screenSize),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildImage(String imageAsset,ColorProvider colorProvider) {
  return SizedBox(
    width: 56,
    height: 56,
    child: Stack(
      children: [
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
            child: Center(
              child: SvgPicture.asset(
                imageAsset,
                fit: BoxFit.scaleDown,
                color: colorProvider.primaryTextColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildJobName(BuildContext context, jobName,ColorProvider colorProvider,Size screensize) {
  return Text(
    jobName,
    style: GoogleFonts.poppins(
      fontSize: ScreenHelper.getFontBasedOnScreenSize(
          context, screensize.width * 0.04, 22, 22),
      fontWeight: FontWeight.bold,
      color: colorProvider.primaryTextColor,
    ),
  );
}

Widget _buildDescription(BuildContext context, String description,ColorProvider colorProvider,Size screensize) {
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
      description,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: ScreenHelper.getFontBasedOnScreenSize(
            context, screensize.width * 0.035, 20, 20),
        color: colorProvider.primaryTextColor,
      ),
    ),
  );
}
