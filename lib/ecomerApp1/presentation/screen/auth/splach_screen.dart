import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/utils/routes/app_routs.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouts.onbordingScrren,
        (final route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final primarycolor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primarycolor,
              primarycolor.withValues(alpha: 0.9),
              primarycolor.withValues(alpha: 0.7),
            ],
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeInOutCirc,
            duration: const Duration(seconds: 2),
            builder:
                (final context, final value, final child) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: value,

                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 7,
                              spreadRadius: 2,
                            ),
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Transform.scale(
                          scale: value,

                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: primarycolor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: value,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 4),
                            child: Text(
                              "FASHION",
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 37,
                                letterSpacing: 10,
                                height: 0,
                              ),
                            ),
                          ),
                          Text(
                            "STORE",
                            style: AppTextStyle.apply(
                              textstyle: AppTextStyle.h1,
                              letterspacing: 5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
