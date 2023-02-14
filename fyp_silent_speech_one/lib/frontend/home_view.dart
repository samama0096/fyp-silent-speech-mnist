import 'package:flutter/material.dart';
import 'package:fyp_silent_speech_one/frontend/home_view/detection_view.dart';
import 'package:fyp_silent_speech_one/frontend/utils/widgets/paddings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'utils/constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> childrenItems = [const DetectionScreen()];
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: MyColors.appbarBackground,
        centerTitle: true,
        title: Text(_selectedIndex == 0 ? "Silent Speech" : "More..."),
        actions: const [
          Icon(
            Icons.info_rounded,
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: childrenItems[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            width: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColors.appbarBackground),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.center,
                activeColor: MyColors.primaryBtnC,
                iconSize: 30,
                gap: 5,
                padding: kPaddingSymetric(true),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70),
                color: Colors.white70,
                tabs: const [
                  GButton(
                    icon: Icons.home_filled,
                    text: 'Home ',
                  ),
                  GButton(
                    icon: Icons.list,
                    text: 'More',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            )),
      ),
    ));
  }
}
