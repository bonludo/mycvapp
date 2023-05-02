import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/themes/color_provider.dart';

import 'package:mycv/viewmodels/contact_me_viewmodel.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);


  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ContactMeViewModel _myViewModel = ContactMeViewModel();

  // Actions for the Contact page (BottomMenu)
  void _contactByEmail() {
    _myViewModel.contactByEmail();
  }

  void _contactGithub() {
    _myViewModel.contactGithub();
  }

  void _contactByPhone() {
    _myViewModel.contactByPhone();
  }

  void _shareApp() {
    _myViewModel.shareWebsite();
  }

  void _viewPdf() {
    // for download pdf but not useful for the moment
  }

 @override
        Widget build(BuildContext context) {
   final colorProvider = ColorProvider.of(context);
      return Container(
        color:colorProvider.backgroundCustomMenu,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _contactByEmail(),
              child: _buildTextButton('M\'écrire',colorProvider),
            ),
            _buildVerticalDivider(colorProvider),
            GestureDetector(
              onTap: () => _contactByPhone(),
              child: _buildTextButton('Me \njoindre',colorProvider),
            ),
            _buildVerticalDivider(colorProvider),
            GestureDetector(
              onTap: () => _contactGithub(),
              child: _buildTextButton('Github \nprojets',colorProvider),
            ),
            _buildVerticalDivider(colorProvider),
            GestureDetector(
              onTap: () => _shareApp(),
              child: _buildTextButton('Partager\nma page',colorProvider),
            ),
          ],
        ),
      );
    }

    Widget _buildTextButton(String text, ColorProvider colorProvider) {
      return SizedBox(
        height: 60,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: colorProvider.textCustomMenu,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget _buildVerticalDivider(ColorProvider colorProvider) {
      Size screenSize = MediaQuery.of(context).size;
      return SizedBox(
        height: 40,
        child: VerticalDivider(color: colorProvider.textCustomMenu, thickness: 1,width:screenSize.width*0.01,),
      );
    }
  }
