import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubitt extends Cubit<ThemeData> {
  ThemeCubitt() : super(Apptheme.lightTheme) {
    loadTheme();
  }

  final String isDarkKey = "isDark";

  Future<void> loadTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool isDark = pref.getBool(isDarkKey) ?? false;

    emit(isDark ? Apptheme.darkTheme : Apptheme.lightTheme);
  }

  Future<void> toggleTheme() async {
    final bool isCurrentlyDark = state == Apptheme.darkTheme;

    // عكس القيمة الحالية
    final bool newIsDark = !isCurrentlyDark;

    // حفظ القيمة
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(isDarkKey, newIsDark);

    // تحديث الحالة
    emit(newIsDark ? Apptheme.darkTheme : Apptheme.lightTheme);
  }
}
