import 'package:flutter/material.dart';
import 'package:fyp_silent_speech_one/frontend/utils/constants/colors.dart';

import 'frontend/home_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Silent Speech',
      home: HomeView(),
    ),
  );
}

getErrorWidget(FlutterErrorDetails errordetais) {
  return Material(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    child: Scaffold(
      backgroundColor: MyColors.secondaryBtnC.withOpacity(0.8),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Skoon e unh??🤨"),
          const Text("R pangy karo suu 🤷‍♂️"),
          Text(errordetais.library!)
        ],
      )),
    ),
  );
}
