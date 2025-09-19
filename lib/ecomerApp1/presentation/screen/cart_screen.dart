import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/model/prudic_model.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),

        title: Text("My Cart", style: AppTextStyle.h3),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pruductList.length,
                itemBuilder:
                    (final context, final index) => cardcart(context, index),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total (${pruductList.length} items)"),
                      Text(
                        "\$154.00",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "proceed yo checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container cardcart(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              pruductList[index].image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                pruductList[index].name,
                style: AppTextStyle.apply(
                  textstyle: AppTextStyle.b2,
                  fwight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              Text(
                "\$${pruductList[index].price.toStringAsFixed(2)}",
                style: AppTextStyle.apply(
                  textstyle: AppTextStyle.b2,
                  fwight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  showdilog(context);
                },
                icon: Icon(Icons.delete, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 10),
              Container(
                height: 30,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove,
                        size: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "1",
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showdilog(final BuildContext context) {
  showDialog(
    context: context,
    builder: (final context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        icon: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
          ),
          child: Icon(
            Icons.delete_outline_outlined,
            color: Theme.of(context).primaryColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text("Remove", style: AppTextStyle.b1),
            Text(
              "Are you sure you want to delete this item?",
              style: AppTextStyle.apply(
                textstyle: AppTextStyle.b3,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "cancel",
              style: AppTextStyle.apply(
                textstyle: AppTextStyle.b2,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              "confirm",
              style: AppTextStyle.apply(
                textstyle: AppTextStyle.b2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
