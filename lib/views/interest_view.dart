import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycv/models/interest.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/screenhelper.dart';
import 'package:mycv/viewmodels/interest_viewmodel.dart';
import 'package:mycv/widget/first_name_last_name_job.dart';
import 'package:mycv/widget/title_view_and_number.dart';

class InterestView extends StatelessWidget {
  final InterestViewModel _viewModel = InterestViewModel();

  InterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    const String title = 'Intérêts';
    const String number = '05';
    final double leftNumber = screenSize.width * 0.29;

    return FutureBuilder(
      future: _viewModel.loadInterests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            color: colorProvider.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(
                    //-------------------------------------- Title of the view
                    child: TitleViewAndNumberWidget(
                      title: title,
                      number: number,
                      leftNumber: ScreenHelper.getWidthBasedOnScreenSize(
                          context, leftNumber, leftNumber, 200),
                    ),
                  ),
                  //------------------------------------------logo of the view
                  Container(
                      alignment: Alignment.bottomRight,
                      child: const FirstNameLastNameJob()),

                  SizedBox(width: screenSize.width * 0.04),
                ]),
                const SizedBox(width: 10),
                //------------------------------------------- 1  list gridview
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 850,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [
                        if (screenSize.width >= 820)
                          const SizedBox(height: 35),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 1100
                                      ? 3
                                      : 2,
                              crossAxisSpacing:
                                  MediaQuery.of(context).size.width > 1100
                                      ? 30.00
                                      : 1.00,
                              mainAxisSpacing:
                                  MediaQuery.of(context).size.width > 1000
                                      ? 30.00
                                      : 1.00,
                              // childAspectRatio: 1.00,
                              // mainAxisExtent: (270)
                            ),
                            itemCount: _viewModel.interests.length,
                            itemBuilder: (context, index) {
                              Interest interest = _viewModel.interests[index];
                              return GestureDetector(
                                // //---------------------navigate to detail//
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           InterestDetail(interest: interest,colorProvider : colorProvider),
                                //     ),
                                //   );
                                // },
                                // //---------------------navigate to detail//
                                child: Center(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 400.0,
                                      maxHeight: 400,
                                    ),
                                    padding: const EdgeInsets.all(5.0),
                                    child: Card(
                                      color: colorProvider.secondaryColor,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              InterestViewModel()
                                                  .interestImages[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: AutoSizeText(
                                                interest.name,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: colorProvider
                                                      .primaryTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          //--------------------------------- 1  list gridview
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class InterestDetail extends StatelessWidget {
  final Interest interest;
  final ColorProvider colorProvider;

  const InterestDetail(
      {Key? key, required this.interest, required this.colorProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: AutoSizeText(
                          // '${interest.myFavorite} '
                          'Je sais ! tu veux en savoir plus, mais la page est en cours de création',
                          style: TextStyle(
                            color: colorProvider.primaryTextColor,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
