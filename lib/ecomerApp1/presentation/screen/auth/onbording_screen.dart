import 'package:flutter/material.dart';
import 'package:fluttertest/data/onbording_model.dart';

import 'package:fluttertest/ecomerApp1/utils/routes/app_routs.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentindex = 0;
  PageController pageController = PageController();
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isdark = Theme.of(context).brightness == Brightness.dark;

    final primarycolor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (final value) {
              setState(() {
                currentindex = value;
              });
            },
            itemCount: onbordingList.length,
            itemBuilder: (final context, final index) {
              final data = onbordingList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(data.image, height: size.height * 0.5),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(data.title, style: AppTextStyle.h2),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      data.description,
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b2,
                        color: isdark ? Colors.white60 : Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onbordingList.length, (final index) {
                return AnimatedContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: currentindex == index ? 25 : 15,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        currentindex == index
                            ? primarycolor
                            : isdark
                            ? Colors.white24
                            : Colors.black26,
                  ),
                );
              }),
            ),
          ),
          Positioned(
            left: 0,
            right: 15,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentindex != onbordingList.length - 1
                    ? TextButton(
                      onPressed: () {},
                      child: Text(
                        "Skip ",
                        style: AppTextStyle.apply(
                          textstyle: AppTextStyle.h3,
                          color: isdark ? Colors.white60 : Colors.black54,
                        ),
                      ),
                    )
                    : const SizedBox(),
                GestureDetector(
                  onTap: () {
                    if (currentindex == onbordingList.length - 1) {
                      Navigator.pushReplacementNamed(context, AppRouts.login);
                    } else {
                      pageController.animateToPage(
                        currentindex + 1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: AnimatedContainer(
                    height: 50,
                    width: currentindex != onbordingList.length - 1 ? 100 : 190,
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child:
                        currentindex != onbordingList.length - 1
                            ? Text(
                              "Next",
                              style: AppTextStyle.apply(
                                textstyle: AppTextStyle.h3,
                                color: Colors.white,
                                letterspacing: 3.2,
                              ),
                            )
                            : Text(
                              "Get Started",
                              style: AppTextStyle.apply(
                                textstyle: AppTextStyle.h3,
                                color: Colors.white,
                                letterspacing: 3.2,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
