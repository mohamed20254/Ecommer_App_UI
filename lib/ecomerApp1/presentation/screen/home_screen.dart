import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest/ecomerApp1/logic/theme_cubit.dart';
import 'package:fluttertest/ecomerApp1/model/prudic_model.dart';
import 'package:fluttertest/ecomerApp1/utils/constant.dart';
import 'package:fluttertest/ecomerApp1/utils/routes/app_routs.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationcontroler;
  @override
  void initState() {
    animationcontroler = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(microseconds: 400),
    );
    super.initState();
  }

  GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isdark = Theme.of(context).brightness == Brightness.dark;
    final Color primarycolor = Theme.of(context).primaryColor;

    return Scaffold(
      key: keys,
      // drawer: Shell(onToggleTheme: (p0) {}, isDark: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                header(isdark, context),
                const SizedBox(height: 20),
                //=================================
                search(isdark, primarycolor),
                const SizedBox(height: 10),
                const Catogary(),
                const SizedBox(height: 10),
                sale(size, primarycolor),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("populer Product ", style: AppTextStyle.b1),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouts.allprudic);
                      },
                      child: Text(
                        "See All",
                        style: AppTextStyle.apply(
                          textstyle: AppTextStyle.b2,
                          color: primarycolor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const prudicgrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container sale(final Size size, final Color primarycolor) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width,
      decoration: BoxDecoration(
        color: primarycolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get your",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.h3,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Special sale",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.h2,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Up to 40%",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.h3,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            child: const Text(
              "Shope Now",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  TextField search(final bool isdark, final Color primarycolor) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        hintText: "Search",
        hintStyle: AppTextStyle.apply(
          textstyle: AppTextStyle.b2,
          color: isdark ? Colors.white60 : Colors.black54,
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.line_style_rounded),
        filled: true,
        fillColor: isdark ? Colors.grey.shade800 : Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isdark ? Colors.white60 : Colors.black54,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primarycolor),
        ),
      ),
    );
  }

  Row header(final bool isdark, final BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(backgroundImage: AssetImage(Appimages.mohamed)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "mohamed fawzy",
              style: AppTextStyle.apply(
                textstyle: AppTextStyle.b3,
                color: isdark ? Colors.white60 : Colors.black54,
              ),
            ),
            Text("good Morning", style: AppTextStyle.b1),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.read<ThemeCubitt>().toggleTheme();
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (final child, final animation) {
              return RotationTransition(
                turns: Tween<double>(begin: 0, end: 1).animate(animation),
                child: child,
              );
            },
            child:
                isdark
                    ? const Icon(Icons.dark_mode, key: ValueKey('dark'))
                    : const Icon(Icons.light_mode, key: ValueKey('light')),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouts.notivigation);
          },
          icon: const Icon(Icons.notifications_none),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouts.cartScreen);
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }
}

class prudicgrid extends StatelessWidget {
  const prudicgrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 8,
      ),
      itemCount: pruductList.length,
      itemBuilder: (final context, final index) {
        final prudct = pruductList[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouts.prudicDetils,
              arguments: Pudictdeisarg(prudicModel: prudct, index: index),
            );
          },
          child: CardPrudic(prudic: prudct, index: index),
        );
      },
    );
  }
}

class Catogary extends StatefulWidget {
  const Catogary({super.key});

  @override
  State<Catogary> createState() => _CatogaryState();
}

class _CatogaryState extends State<Catogary> {
  @override
  void initState() {
    print("==================================================");
    super.initState();
  }

  final List<String> catogary = ["All", "Men", "Women", "Girl", "children"];
  int slectedindex = 0;
  @override
  Widget build(final BuildContext context) {
    print("==================================================");
    final bool isdark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(catogary.length, (final index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: ChoiceChip(
                label: Text(
                  catogary[index],
                  style: TextStyle(
                    color: slectedindex == index ? Colors.white : null,
                  ),
                ),
                selected: slectedindex == index,
                backgroundColor:
                    isdark ? Colors.grey.shade700 : Colors.grey.shade200,
                selectedColor: Theme.of(context).primaryColor,
                selectedShadowColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onSelected: (final value) {
                  setState(() {
                    slectedindex = value ? index : slectedindex;
                  });
                },
                elevation: slectedindex == index ? 2 : 0,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 4,
                ),
                side: BorderSide(
                  color:
                      slectedindex == index
                          ? Colors.transparent
                          : isdark
                          ? Colors.grey.shade700
                          : Colors.grey.shade200,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CardPrudic extends StatelessWidget {
  final PrudicModel prudic;
  final int index;
  const CardPrudic({super.key, required this.prudic, required this.index});

  @override
  // ignore: prefer_final_parameters
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    prudic.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 5,

                child: Icon(
                  Icons.favorite_border,
                  color:
                      prudic.isfav
                          ? Colors.deepOrange
                          : isdark
                          ? Colors.white60
                          : Colors.black54,
                ),
              ),
              Positioned(
                top: 2,
                left: 4,
                child:
                    prudic.oldprice != null
                        ? Container(
                          padding: const EdgeInsets.all(5),
                          constraints: BoxConstraints(
                            maxWidth: screenwidth * 0.4,
                          ),

                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "${discount(oldprice: prudic.oldprice!, price: prudic.price)} % off",
                            style: AppTextStyle.apply(
                              textstyle: AppTextStyle.b2,
                              color: Colors.white,
                            ),
                          ),
                        )
                        : const SizedBox(),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(prudic.name, style: AppTextStyle.b1),
          const SizedBox(height: 5),
          Text(
            prudic.catogary,
            style: AppTextStyle.apply(
              textstyle: AppTextStyle.b2,
              color: isdark ? Colors.white60 : Colors.black54,
            ),
          ),
          Row(
            children: [
              Text("\$${prudic.price}", style: AppTextStyle.h3),
              if (prudic.oldprice != null) ...[
                SizedBox(width: screenwidth * 0.01),
                Text(
                  "\$${prudic.oldprice!.toStringAsFixed(2)}",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.b2,
                    color: isdark ? Colors.white60 : Colors.black54,
                  ).copyWith(decoration: TextDecoration.lineThrough),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  int discount({required final double oldprice, required final double price}) {
    return (((oldprice - price) / oldprice) * 100).round();
  }
}
