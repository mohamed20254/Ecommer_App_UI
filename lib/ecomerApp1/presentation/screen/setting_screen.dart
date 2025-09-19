import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/ecomerApp1/logic/theme_cubit.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: AppTextStyle.h3),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Appearance", style: AppTextStyle.b1),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: ListTile(
                  title: Text("Dark Mode", style: AppTextStyle.b2),
                  leading: Icon(
                    Icons.light_mode,
                    color: Theme.of(context).primaryColor,
                  ),
                  trailing: Switch.adaptive(
                    activeColor: Theme.of(context).primaryColor,

                    value: isdark,
                    onChanged: (final value) {
                      context.read<ThemeCubitt>().toggleTheme();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text("Notifications", style: AppTextStyle.b1),
              const SizedBox(height: 10),
              Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("Push Notification", style: AppTextStyle.b1),
                  subtitle: const Text(
                    "recive push notification about orders and promation",
                  ),
                  trailing: Switch.adaptive(
                    activeColor: Theme.of(context).primaryColor,

                    value: true,
                    onChanged: (final value) {
                      //===================================push notifacaton
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("Email Notification", style: AppTextStyle.b1),
                  subtitle: const Text(
                    "recive email appdate about your orders ",
                  ),
                  trailing: Switch.adaptive(
                    activeColor: Theme.of(context).primaryColor,

                    value: false,
                    onChanged: (final value) {
                      //===================================push notifacaton
                    },
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Text("Privacy", style: AppTextStyle.b1),
              _builssecation(
                context,
                ledding: Icon(
                  Icons.privacy_tip_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("Privacy policy"),
                subtitle: const Text("View our privacy policy"),
              ),
              _builssecation(
                context,
                ledding: Icon(
                  Icons.file_present,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("Terms of Servie"),
                subtitle: const Text("read out Terms of Servie"),
              ),
              const SizedBox(height: 20),
              Text("About", style: AppTextStyle.b1),
              const SizedBox(height: 10),
              _builssecation(
                context,
                ledding: Icon(
                  Icons.info_outline_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("App Version"),
                subtitle: const Text("1.0.0"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _builssecation(
    final BuildContext context, {
    required final Widget ledding,
    required final Widget title,
    required final Widget subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: ListTile(
        leading: ledding,
        subtitle: subtitle,
        title: title,
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),
    );
  }
}
