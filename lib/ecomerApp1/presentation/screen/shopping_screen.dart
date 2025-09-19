import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/all_prudict_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/home_screen.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shoping", style: AppTextStyle.h3),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              FilterPrudict.show(context);
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),

      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 9),
            Catogary(),
            SizedBox(height: 20),
            Expanded(child: prudicgrid()),
          ],
        ),
      ),
    );
  }
}
