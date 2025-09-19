import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/model/prudic_model.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/all_prudict_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/auth/create_account.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/auth/login_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/cart_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/main_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/auth/onbording_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/auth/splach_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/notivigaton_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/prudic_detils_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/setting_screen.dart';

class AppRouts {
  static const String splachscreen = "/splashScreen";
  static const String onbordingScrren = "/onbordingScreen";
  static const String login = "/login";
  static const String sinup = "/sonup";
  static const String mainscreen = "/mainscreen";
  static const String prudicDetils = "/prudicdettils";
  static const String allprudic = "/allprudict";
  static const String cartScreen = "/cartscreen";
  static const String settingScreen = "/setiingscreen";
  static const String notivigation = "/notivigationscreen";
  //==============================================

  static Route<dynamic>? onGenerateRoute(final RouteSettings setting) {
    switch (setting.name) {
      case splachscreen:
        {
          return MaterialPageRoute(builder: (_) => const SplachScreen());
        }
      case onbordingScrren:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case sinup:
        return MaterialPageRoute(builder: (_) => const CreateAccount());
      case mainscreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case prudicDetils:
        {
          final arg = setting.arguments as Pudictdeisarg;

          return MaterialPageRoute(
            builder:
                (_) =>
                    PrudicDetilsScreen(data: arg.prudicModel, index: arg.index),
          );
        }
      case allprudic:
        return MaterialPageRoute(builder: (_) => const AllPrudictScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case notivigation:
        return MaterialPageRoute(builder: (_) => const NotivigatonScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(
                  child: Text("No Route", style: TextStyle(fontSize: 40)),
                ),
              ),
        );
    }
  }
}

class Pudictdeisarg {
  final PrudicModel prudicModel;
  final int index;

  Pudictdeisarg({required this.prudicModel, required this.index});
}
