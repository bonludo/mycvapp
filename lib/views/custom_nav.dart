import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mycv/navigation/router_delegate.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/utils/custom_scroll_behavior.dart';
import 'package:mycv/viewmodels/custom_nav_viewmodel.dart';
import 'package:mycv/views/contact_info_view.dart';
import 'package:mycv/views/education_view.dart';
import 'package:mycv/views/interest_view.dart';
import 'package:mycv/views/skill_view.dart';
import 'package:mycv/views/work_experience_view.dart';
import 'package:mycv/widget/contact_slidable.dart';
import 'package:mycv/widget/my_drawer.dart';

class CustomNav extends StatefulWidget {
  const CustomNav({super.key});

  @override
  CustomNavState createState() => CustomNavState();
}

class CustomNavState extends State<CustomNav> {
  final ConfigViewModel _viewModel = ConfigViewModel();
  final MyRouterDelegate routerDelegate = MyRouterDelegate();
  late PageController _pageController;

  int _selectedIndex = 0;
  bool _isDrawerOpen = false;
  bool _showIcons = true;
  Timer? _iconTimer;

  void _onItemTapped(int index) {
    if (MediaQuery.of(context).size.width > 850) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
        _selectedIndex = index;
      });
    }
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _startIconTimer() {
    _iconTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      setState(() {
        // _showIcons = !_showIcons;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _startIconTimer();
  }

  @override
  void dispose() {
    _iconTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  final List<Widget> _viewWidgetOptions = <Widget>[
    ContactInfoView(),
    EducationView(),
    WorkExperienceView(),
    const SkillView(),
    InterestView(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 850;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var isLargeScreen = constraints.maxWidth > 850;

      return Scaffold(
        body: SafeArea(
          child: Container(
            color: colorProvider.primaryColor,
            child: Stack(
              children: [
                //------------------------------------------------------small screen
                if (!isLargeScreen)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        if (_isDrawerOpen && !isLargeScreen) {
                          _toggleDrawer();
                        }
                      },
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            _buildSliverAppBar(),
                          ];
                        },
                        body: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overScroll) {
                            overScroll.disallowIndicator();
                            return true;
                          },
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            physics: isLargeScreen
                                ? const NeverScrollableScrollPhysics()
                                : const AlwaysScrollableScrollPhysics(),
                            children: _viewWidgetOptions
                                .map(
                                  (widget) => Builder(
                                    builder: (BuildContext context) {
                                      return ScrollConfiguration(
                                        behavior: CustomScrollBehavior(
                                            overscrollGlowColor:
                                                colorProvider.primaryColor),
                                        child: widget,
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                //------------------------------------------------------small screen
                //------------------------------------------------------large screen
                if (isLargeScreen)
                  Positioned.fill(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: isLargeScreen
                              ? screenSize.width > 1100
                                  ? 355 + screenSize.width * 0.10
                                  : 355
                              : 0,
                      right:isLargeScreen
                          ? screenSize.width > 1600
                          ? 100
                          : 0
                          : 0, ),
                      child: Center(child: _viewWidgetOptions[_selectedIndex]),
                    ),
                  ),
                //------------------------------------------------------large screen
                //-------------------------------button and Indication for scrolling
                if (isMobile && !isLargeScreen)
                  if (_selectedIndex != 0)
                    Positioned(
                      top: screenSize.height / 2 - 50,
                      left: -20,
                      child: AnimatedOpacity(
                        opacity: _showIcons ? 1 : 0,
                        duration: const Duration(seconds: 5),
                        child: InkWell(
                          onTap: () {
                            _onItemTapped(_selectedIndex - 1);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: screenSize.width * 0.14,
                            height: screenSize.height * 0.08,
                            decoration: BoxDecoration(
                              color:
                                  colorProvider.navButtonColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.40),
                            ),
                            child: Icon(Icons.arrow_back_ios,
                                color: colorProvider.textCustomMenu,
                                size: screenSize.width * 0.09),
                          ),
                        ),
                      ),
                    ),
                if (isMobile && !isLargeScreen)
                  if (_selectedIndex != _viewWidgetOptions.length - 1)
                    Positioned(
                      top: screenSize.height / 2 - 50,
                      right: -20,
                      child: AnimatedOpacity(
                        opacity: _showIcons ? 1 : 0,
                        duration: const Duration(seconds: 5),
                        child: InkWell(
                          onTap: () {
                            _onItemTapped(_selectedIndex + 1);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: screenSize.width * 0.14,
                            height: screenSize.height * 0.08,
                            decoration: BoxDecoration(
                              color: colorProvider.backgroundCustomMenu
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.40),
                            ),
                            child: Icon(Icons.arrow_forward_ios,
                                color: colorProvider.textCustomMenu,
                                size: screenSize.width * 0.09),
                          ),
                        ),
                      ),
                    ),
                //-------------------------------button and Indication for scrolling

                //--------------------------------------------------------Drawer
                AnimatedPositioned(
                  duration: _isDrawerOpen
                      ? const Duration(milliseconds: 200)
                      : const Duration(milliseconds: 0),
                  left: isLargeScreen
                      ? 0
                      : (_isDrawerOpen ? 0 : -constraints.maxWidth * 0.7),
                  top: 0,
                  bottom: 0,
                  width: isLargeScreen ? 355 : constraints.maxWidth * 0.7,
                  child: MyDrawer(
                    selectedIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    viewModel: _viewModel,
                    onMenuButtonTap: _toggleDrawer,
                  ),
                ),
                //--------------------------------------------------------Drawer

                //---------------------------------------DrawerSmallScreenButton
                if (!isLargeScreen)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(5.00),
                      color: colorProvider.backgroundCustomMenu,
                      child: IconButton(
                        icon: _isDrawerOpen && !isLargeScreen
                            ? Icon(
                                Icons.chevron_left,
                                color: colorProvider.primaryTextColor,
                                size: 25,
                              )
                            : Icon(
                                Icons.menu,
                                color: colorProvider.primaryTextColor,
                                size: 20,
                              ),
                        onPressed: _toggleDrawer,
                      ),
                    ),
                  ),
                //---------------------------------------DrawerSmallScreenButton
              ],
            ),
          ),
        ),
        bottomNavigationBar: const ContactPage(),
      );
    });
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.grey,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.asset(
              'assets/images/contact_images/D.png',
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
