import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';
import 'package:mycv/viewmodels/custom_nav_viewmodel.dart';

class MyDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final ConfigViewModel viewModel;
  final VoidCallback onMenuButtonTap;

  const MyDrawer({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.viewModel,
    required this.onMenuButtonTap,
  });

  textScreenAdapter(BuildContext context, ColorProvider colorProvider) {
    if (MediaQuery.of(context).size.width <= 820) {
      return Container(
        color: colorProvider.backgroundCustomMenu,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'FERMER',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: colorProvider.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      );
    } else {
      return Container(
        color: colorProvider.primaryTextColor,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'BONBONDEV',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: colorProvider.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      );
    }
  }

  Widget buildHeaderDrawer(BuildContext context, VoidCallback onHeaderTap,
          ColorProvider colorProvider) =>
      GestureDetector(
        onTap: onHeaderTap,
        child: textScreenAdapter(context, colorProvider),
      );

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 820;

    double titleFontSize = screenWidth * 0.05;
    double subTitleFontSize = screenWidth * 0.07;
    double devTitleFontSize = screenWidth * 0.04;

    return Drawer(
      child: Column(
        children: <Widget>[
          buildHeaderDrawer(context, onMenuButtonTap, colorProvider),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    //---------- LIST PAGE  ----------
                    ListTile(
                      selected: selectedIndex == index,
                      selectedTileColor: colorProvider.primaryColor,
                      leading: Icon(
                        viewModel.icons[index],
                        color: selectedIndex == index
                            ? colorProvider.primaryTextColor
                            : colorProvider.primaryColor,
                      ),
                      title: Row(
                        children: [
                          Text(
                            viewModel.titles[index],
                            style: GoogleFonts.poppins(
                              fontSize: ScreenHelper.getFontBasedOnScreenSize(context, titleFontSize, 24, 26),
                              color: selectedIndex == index
                                  ? colorProvider.primaryTextColor
                                  : colorProvider.secondaryTextColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            ' 0${index + 1}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenHelper.getFontBasedOnScreenSize(context, subTitleFontSize, 32, 42),
                              color: colorProvider.textNumberDrawer,
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          )
                        ],
                      ),
                      onTap: () {
                        onTap(index);
                        onMenuButtonTap();
                      },
                      contentPadding: selectedIndex == index
                          ? const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 8)
                          : const EdgeInsets.only(left: 5, top: 8, bottom: 8),
                    ),

                    //---------- DIVIDER ----------
                    if (index != viewModel.titles.length)
                      Divider(
                        color: colorProvider.primaryColor,
                        thickness: 1.5,
                        height: 1,
                      ),
                    if (index == viewModel.titles.length - 1)

                      //---------- SIGNATURE + DEV JUNIOR  ----------
                      Column(
                        children: [
                          SizedBox(
                            height: screenWidth <= 820? 35 : 100
                          ),
                          SvgPicture.asset(
                              'assets/images/contact_images/signaturecol.svg'),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Développeur',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: ScreenHelper.getFontBasedOnScreenSize(context, devTitleFontSize, 24, 26),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
