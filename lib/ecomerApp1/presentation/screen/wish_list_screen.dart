import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/model/prudic_model.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final favoritbrudict =
      pruductList.where((final element) => element.isfav).toList();
  @override
  Widget build(final BuildContext context) {
    final bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("My WishList", style: AppTextStyle.h3),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: CustomScrollView(
        slivers: [
          addSllList(isdark, context),
          SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: favoritbrudict.length,
                (final context, final index) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.asset(
                            favoritbrudict[index].image,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoritbrudict[index].name,
                                style: AppTextStyle.b1,
                              ),
                              Text(favoritbrudict[index].catogary),

                              Row(
                                children: [
                                  Text(
                                    "\$${favoritbrudict[index].price.toStringAsFixed(2)}",
                                    style: AppTextStyle.h3,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  const Icon(Icons.delete_outline_outlined),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter addSllList(final bool isdark, final BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isdark ? Colors.grey.shade800 : Colors.grey.shade200,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${favoritbrudict.length} items", style: AppTextStyle.h3),
                Text(
                  "in your wislist",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.b2,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
              child: Text(
                "Add All To Cart",
                style: AppTextStyle.apply(
                  textstyle: AppTextStyle.b3,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
