import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/models/skill.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';
import 'package:mycv/viewmodels/skill_viewmodel.dart';
import 'package:mycv/widget/first_name_last_name_job.dart';
import 'package:mycv/widget/title_view_and_number.dart';

class SkillView extends StatefulWidget {
  const SkillView({super.key});

  @override
  SkillViewState createState() => SkillViewState();
}

class SkillViewState extends State<SkillView> {
  final SkillViewModel _myViewModel = SkillViewModel();
  List<Skill> _skills = [];

  @override
  void initState() {
    super.initState();
    _myViewModel.loadSkills().then((skills) {
      setState(() {
        _skills = skills;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    Size screenSize = MediaQuery.of(context).size;
    String title = 'Compétence';
    String number = '04';
    double leftNumber = screenSize.width * 0.39;
    int screenChanger = 1280;

    return Container(
      color: colorProvider.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TitleViewAndNumberWidget(
                  title: title,
                  number: number,
                  leftNumber: ScreenHelper.getWidthBasedOnScreenSize(
                      context, leftNumber, leftNumber, 300),
                ),
              ),
              if (screenSize.width >= 1000)
                Container(
                  alignment: Alignment.bottomRight,
                  child: const FirstNameLastNameJob(),
                ),
              SizedBox(width: screenSize.width * 0.01)
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(maxWidth: 850),
              child: Column(
                children: [
                  if (screenSize.width >= 820) const SizedBox(height: 35),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width > screenChanger
                                ? 3
                                : 2,
                        crossAxisSpacing:
                            MediaQuery.of(context).size.width > screenChanger
                                ? 40.00
                                : 8.00,
                        mainAxisSpacing:
                            MediaQuery.of(context).size.width > screenChanger
                                ? 30.00
                                : 1.00,
                      ),
                      itemCount: _skills.length,
                      itemBuilder: (context, index) {
                        Skill skill = _skills[index];
                        bool isLastItem = index == _skills.length - 1;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          constraints: const BoxConstraints(

                          ),
                          child: buildCard(
                              index, skill, colorProvider, screenSize, screenChanger,isLastItem),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (screenSize.width >= 820)
          const SizedBox(height: 10,)
        ],
      ),
    );
  }

  //----------------------------------------Card With dialog----------------//

  GestureDetector buildCard(
      int index, Skill skill, ColorProvider colorProvider, Size screenSize, int screenChanger, bool isLastItem) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                color: screenSize.width < screenChanger
                    ? (index % 4 == 0 || index % 4 == 3
                    ? colorProvider.thirdlyColor
                    : colorProvider.secondaryColor)
                    : (index % 2 == 0 || index % 1 == 2
                    ? colorProvider.thirdlyColor
                    : colorProvider.secondaryColor),
                width: ScreenHelper.getWidthBasedOnScreenSize(
                    context, screenSize.width * 0.8, 650, 650),
                // size of dialog container
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:const EdgeInsets.all(10.0) ,
                      child: Image.asset(
                        _myViewModel.imageSkillCode0[index],
                        color: colorProvider.primaryTextColor,
                        width: ScreenHelper.getWidthBasedOnScreenSize(context,
                            screenSize.width * 0.2, screenSize.width * 0.2, 80),
                        height: ScreenHelper.getHeightBasedOnScreenSize(context,
                            screenSize.width * 0.2, screenSize.width * 0.2, 80),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          skill.typeOfSkills,
                          style: GoogleFonts.poppins(
                              fontSize: ScreenHelper.getFontBasedOnScreenSize(
                                  context, 20, 40, 40),
                              fontWeight: FontWeight.bold,
                              color: colorProvider.primaryTextColor),
                        ),
                      ),
                    ),
                    Divider(
                      color: screenSize.width < screenChanger
                          ? (index % 4 == 0 || index % 4 == 3
                          ? colorProvider.secondaryColor
                          : colorProvider.thirdlyColor)
                          : (index % 2 == 0 || index % 1 == 2
                          ? colorProvider.secondaryColor
                          : colorProvider.thirdlyColor),
                    ),
                    Column(
                      children: [
                        for (String name in skill.name)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            child: Text(
                              name,
                              style: GoogleFonts.poppins(
                                  fontSize:
                                      ScreenHelper.getFontBasedOnScreenSize(
                                          context, 18, 36, 36),
                                  color: colorProvider.primaryTextColor),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        color: screenSize.width < screenChanger
            ? (index % 4 == 0 || index % 4 == 3
            ? colorProvider.thirdlyColor
            : colorProvider.secondaryColor)
            : (index % 2 == 0 || index % 1 == 2
            ? colorProvider.thirdlyColor
            : colorProvider.secondaryColor),
        child: Column(
          children: [
            SizedBox(height: ScreenHelper.getHeightBasedOnScreenSize(context,
                screenSize.width * 0.04, screenSize.width * 0.04, 25),),
            Image.asset(
              _myViewModel.imageSkillCode0[index],
              color: colorProvider.primaryTextColor,
              width: ScreenHelper.getWidthBasedOnScreenSize(context,
                  screenSize.width * 0.10, screenSize.width * 0.10, 80),
              height: ScreenHelper.getHeightBasedOnScreenSize(
                  context, screenSize.width * 0.1, screenSize.width * 0.1, 80),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
              child: Text(
                skill.typeOfSkills,
                style: GoogleFonts.poppins(
                    fontSize:
                    screenSize.width < 1280 ?
                    ScreenHelper.getFontBasedOnScreenSize(context,
                        screenSize.width * 0.04, screenSize.width * 0.04, 25) :
                    ScreenHelper.getFontBasedOnScreenSize(context,
                        screenSize.width * 0.04, screenSize.width * 0.04, 25),
                    fontWeight: FontWeight.bold,
                    color: colorProvider.primaryTextColor),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Wrap(
                children: skill.name.map((name) {

                  if (isLastItem) {
                    return Container();
                  }

                  bool shouldDisplay = false;
                  bool isScreenLarge = screenSize.width >= 1150;
                  bool isNameShort = name.length <= 8;

                  // Retirer les noms entre parenthèses
                  String nameWithoutParentheses =
                      name.contains("(") ? name.split("(")[0].trim() : name;

                  if (isScreenLarge) {
                    shouldDisplay = true;
                  } else if (!isScreenLarge && isNameShort) {
                    shouldDisplay = true;
                  }

                  return shouldDisplay
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenHelper.getHeightBasedOnScreenSize(
                                context,
                                screenSize.height * 0.01,
                                screenSize.height * 0.01,
                                5),
                            horizontal: ScreenHelper.getWidthBasedOnScreenSize(
                                context,
                                screenSize.width * 0.01,
                                screenSize.width * 0.01,
                                5),
                          ),
                          child: Text(
                            nameWithoutParentheses,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: ScreenHelper.getFontBasedOnScreenSize(
                                  context,
                                  screenSize.width * 0.039,
                                  screenSize.width * 0.039,
                                  16),
                              color: colorProvider.primaryTextColor,
                            ),
                          ),
                        )
                      : Container();
                }).toList(),
              ),
            ),
            if (screenSize.width <= screenChanger || isLastItem )
              SizedBox(
                height: 30.0,
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.add_box_outlined,
                        color: colorProvider.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
