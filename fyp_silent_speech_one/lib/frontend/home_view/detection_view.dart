import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:pytorch_lite/pytorch_lite.dart';

import '../utils/constants/colors.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  String detectedText = 'Apple';
  bool isVoiceEnabled = false;
  bool isCameraStarted = false;

  loadModel() async {
    await PytorchLite.loadClassificationModel(
      "lib/assets/ml/cnnModel.pt",
      28,
      28,
    ).then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            radius: 40,
            backgroundColor:
                isVoiceEnabled ? Colors.white : MyColors.appbarBackground,
            child: Opacity(
              opacity: isVoiceEnabled ? 1 : 0.3,
              child: Lottie.asset("lib/assets/lotties/voice-animation.json",
                  repeat: isVoiceEnabled, fit: BoxFit.cover),
            ),
          ),
          onPressed: () {
            setState(() {
              isVoiceEnabled = !isVoiceEnabled;
            });
          }),
      backgroundColor: MyColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: s.height * 0.4,
            width: s.width * 0.85,
            decoration: BoxDecoration(
              color: MyColors.appbarBackground,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Opacity(
              opacity: 0.05,
              child: Lottie.asset("lib/assets/lotties/camera.json",
                  repeat: false, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              detectedText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                InkWell(
                  onTap: () async {
                    try {
                      await loadModel();
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      isCameraStarted = !isCameraStarted;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: MyColors.appbarBackground,
                    radius: 50,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset("lib/assets/lotties/camera.json",
                            repeat: true, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCameraStarted,
                  child: Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 15,
                      child: Center(
                        child: Lottie.asset("lib/assets/lotties/rec.json",
                            repeat: true, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
