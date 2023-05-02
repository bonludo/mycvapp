import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/models/contact_info.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/viewmodels/contact_info_viewmodel.dart';
import 'package:mycv/views/professional_summary_view.dart';

class ContactInfoView extends StatelessWidget {
  final ContactInfoViewModel _myViewModel = ContactInfoViewModel();

  ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    return FutureBuilder<ContactInfo>(
      future: _myViewModel.loadContactInfo().then((value) => value!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            ContactInfo contactInfo = snapshot.data!;
            return Scaffold(
              body: Container(
                decoration:  BoxDecoration(
                  color: colorProvider.primaryColor,
                ),
                child: CustomScrollView(
                  slivers: [
                    _buildInfo(contactInfo, context, colorProvider),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Une erreur est survenue'));
          } else {
            return const Center(child: Text('Aucune donnée à afficher'));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  SliverList _buildInfo(ContactInfo contactInfo, BuildContext context, ColorProvider colorProvider) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SliverList(
      delegate: SliverChildListDelegate([
        Container( constraints: const BoxConstraints(maxWidth: 1000),
            color: Colors.transparent,
            padding: const EdgeInsets.all(25.0),
            child: AnimatedBuilder(
                animation: _myViewModel,
                builder: (context, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //---------- ADDRESS CITY ---------
                           Icon(
                            Icons.house_outlined,
                            color: colorProvider.primaryTextColor,
                          ),
                          Text(
                            contactInfo.address!.city,
                            style: GoogleFonts.poppins(
                              color: colorProvider.primaryTextColor,
                            ),
                          ),
                          Text(
                            ', ${contactInfo.address!.zip.substring(0, 2)}',
                            style: GoogleFonts.poppins(
                              color: colorProvider.primaryTextColor,
                            ),
                          ),

                          const SizedBox(width: 10),

                          //---------- LICENSE ? ---------
                           Icon(
                            Icons.directions_car_filled_outlined,
                            color: colorProvider.primaryTextColor,
                          ),
                          if (contactInfo.driverLicence)
                            const SizedBox(width: 3),
                          Text(
                            'Permis B',
                            style: GoogleFonts.poppins(
                              color: colorProvider.primaryTextColor,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      //---------- HI, MY NAME IS ---------
                      AutoSizeText(
                        'Bonjour, je m\'appelle',
                        maxLines: 1,
                        maxFontSize: 28,
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          height: 2,
                        ),
                      ),
                      //---------- FIRST NAME ---------
                      firstNameLastNameJob(contactInfo, colorProvider),

                      const SizedBox(height: 30),

                      Container(
                        alignment: Alignment.topLeft,
                          width: screenWidth * 0.69,
                          child: ProfessionalSummaryView()),

                      const SizedBox(
                        height: 30,
                      ),
                      //-----------MY STORY BUTTON -------------
                      if (screenWidth <= 820)
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(colorProvider.primaryTextColor,),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(8.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => IntroScreen()),
                            );
                          },
                          child: Text('Lancer MyStory',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: colorProvider.primaryColor,
                              )),
                        ),
                      ),
                      //-----------MY STORY BUTTON -------------

                      const SizedBox(
                        height: 45,
                      ),

                      Container(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          'assets/images/contact_images/signaturesg.svg',
                          alignment: Alignment.bottomLeft,
                          width: 80,
                          height: 40,
                        ),
                      ),
                    ],
                  );
                })),
      ]),
    );
  }

  Column firstNameLastNameJob(ContactInfo contactInfo, ColorProvider colorProvider) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Baseline(
            baseline: 55,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              contactInfo.firstName!,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: colorProvider.primaryTextColor,
                fontSize: 67,
                height: 1,
              ),
            ),
          ),
        ),

        //---------- PROFESSIONAL PRESENTATION ---------
        Container(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //---------- LAST NAME ----------
              AutoSizeText(
                contactInfo.lastName!.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: colorProvider.primaryTextColor,
                  fontSize: 38,
                  height: 1,
                ),
                maxLines: 1,
              ),
              const SizedBox(width: 10),

              //---------- JOB SEARCH ----------
              Column(
                children: [
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3.0, vertical: 7.0),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: colorProvider.primaryTextColor,
                      ),
                      child: Center(
                        child: AutoSizeText(

                          contactInfo.jobSearch!,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: colorProvider.primaryColor),
                        ),
                      )),
                  const SizedBox(height: 8,)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
