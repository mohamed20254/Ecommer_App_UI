import 'package:flutter/material.dart';

import 'package:fluttertest/ecomerApp1/utils/constant.dart';
import 'package:fluttertest/ecomerApp1/utils/routes/app_routs.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account", style: AppTextStyle.h3),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouts.settingScreen);
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isdark ? Colors.grey.shade800 : Colors.grey.shade100,
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(Appimages.mohamed),
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  Text("Mohamed Fawzy", style: AppTextStyle.b1),
                  Text(
                    "Moha015485@gmail.com",
                    style: AppTextStyle.apply(
                      textstyle: AppTextStyle.b3,
                      color: isdark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Edit profile",
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b2,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildmenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildmenuSection(final BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.shopping_bag_outlined, "title": "My Orders"},
      {"icon": Icons.location_on_outlined, "title": "Shipping Address"},
      {"icon": Icons.help_outline, "title": "Help center"},
      {"icon": Icons.logout, "title": "Logout"},
    ];
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children:
            menuItems
                .map(
                  (final element) => GestureDetector(
                    onTap: () {
                      if (element['title'] == "Logout") {
                        _showDilog(context);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: ListTile(
                        leading: Icon(
                          element['icon'] as IconData,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(element['title'] as String),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  void _showDilog(final BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (final context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(24),
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.logout, color: Theme.of(context).primaryColor),
          ),
          content: Text(
            "Are you sure you want to log out?",
            style: AppTextStyle.apply(
              textstyle: AppTextStyle.b2,
              color: isdark ? Colors.white70 : Colors.black87,
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,

              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b1,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "logout",
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
