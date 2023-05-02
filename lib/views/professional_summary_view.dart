import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/models/professional_summary.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/viewmodels/professional_summary_viewmodel.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mycv/views/custom_nav.dart';

class ProfessionalSummaryView extends StatelessWidget {
  final ProfessionalSummaryViewModel _professionalSummaryViewModel =
      ProfessionalSummaryViewModel();

  ProfessionalSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    return FutureBuilder<ProfessionalSummary?>(
      future: _professionalSummaryViewModel.loadProfessionalSummary(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            ProfessionalSummary professionalSummary = snapshot.data!;
            final screenWidth = MediaQuery.of(context).size.width;
            final isLargeScreen = screenWidth > 600;
            return isLargeScreen
                ? presentationIsLargeScreen(professionalSummary,colorProvider)
                : presentationIsSmallScreen(professionalSummary,colorProvider);
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

  RichText boldWord2(
      String myText, List<String> wordSearch, List<TextSpan> textSpans,ColorProvider colorProvider) {
    for (String word in wordSearch) {
      if (myText.contains(word)) {
        int indexStart = myText.indexOf(word);
        int indexEnd = indexStart + word.length;
        textSpans.add(
          TextSpan(
            text: myText.substring(0, indexStart),
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16.0,
            ),
          ),
        );
        textSpans.add(
          TextSpan(
            text: myText.substring(indexStart, indexEnd),
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16.0,
            ),
          ),
        );
        myText = myText.substring(indexEnd);
      }
    }
    textSpans.add(
      TextSpan(
        text: myText,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
    return RichText(
      text: TextSpan(
          children: textSpans,
          style: GoogleFonts.poppins(
            color: colorProvider.primaryTextColor,
            height: 1.5,
          )),
    );
  }

  List<String> boldWord = [
    "un développeur",
    "des normes",
    "accessibilité",
    "eco-responsable",
    "eco-conception"
  ];
  List<TextSpan> textSpans = [];

  RichText presentationIsSmallScreen(ProfessionalSummary professionalSummary,ColorProvider colorProvider) {
    return boldWord2(professionalSummary.presentation, boldWord, textSpans,colorProvider);
  }

  RichText presentationIsLargeScreen(ProfessionalSummary professionalSummary,ColorProvider colorProvider) {
    return boldWord2(professionalSummary.presentation, boldWord, textSpans,colorProvider);
  }
}

class IntroScreen extends StatelessWidget {
  final ProfessionalSummaryViewModel _viewModel =
      ProfessionalSummaryViewModel();
  final introKey = GlobalKey<IntroductionScreenState>();
  int index = 0;

  int indexText(int? chapter) {
    index = chapter ?? 0;
    return index;
  }

  IntroScreen({super.key});

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CustomNav()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return FutureBuilder<ProfessionalSummary?>(
      future: ProfessionalSummaryViewModel().loadProfessionalSummary(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final professionalSummary = snapshot.data!;
            final myStoryProList = professionalSummary.myStoryPro ?? [];
            final pages = myStoryProList
                .map((chapter) => PageViewModel(
                      title: "Chapitre ${chapter.chapter} : ${chapter.title}",
                      body: chapter.text!,
                      image: SvgPicture.asset(
                          _viewModel
                              .imageMyStory[indexText(chapter.chapter) - 1],
                          placeholderBuilder: (BuildContext context) =>
                              Image.network(_viewModel.imageMyStorySav[
                                  indexText(chapter.chapter) - 1]),
                          height: 300),
                      decoration: pageDecoration,
                    ))
                .toList();

            return IntroductionScreen(
              key: introKey,
              pages: pages,
              onDone: () => _onIntroEnd(context),
              done: Text('Terminer',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              showSkipButton: true,
              skip: Text('Passer',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              next: const Icon(Icons.arrow_forward),
              dotsDecorator: const DotsDecorator(
                size: Size(5.0, 5.0),
                color: Color(0xFFBDBDB),
                activeColor: Color(0xFFf37b83),
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Une erreur est survenue',
            ));
          } else {
            return const Center(child: Text('Aucune donnée à afficher'));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
