import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/model/prudic_model.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class PrudicDetilsScreen extends StatefulWidget {
  final PrudicModel data;
  final int index;
  const PrudicDetilsScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  State<PrudicDetilsScreen> createState() => _PrudicDetilsScreenState();
}

class _PrudicDetilsScreenState extends State<PrudicDetilsScreen> {
  List<String> prudicSize = ["M", "L", "xL", 'XXL'];
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(final BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Text("Details", style: AppTextStyle.h3),
        actions: const [Icon(Icons.share)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    widget.data.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const Positioned(
                  top: 10,
                  left: 10,
                  child: Icon(Icons.favorite_border),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data.name, style: AppTextStyle.h3),
                    Text(
                      widget.data.catogary,
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b2,
                        color: isdark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text("\$${widget.data.price}", style: AppTextStyle.h3),
              ],
            ),
            const SizedBox(height: 15),
            Text("Selecte Size", style: AppTextStyle.b2),
            ValueListenableBuilder(
              valueListenable: currentIndex,
              builder:
                  (context, value, child) => Row(
                    children: List.generate(prudicSize.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ChoiceChip(
                          selectedColor: Theme.of(context).primaryColor,
                          elevation: 0,
                          iconTheme: IconThemeData(color: Colors.white),
                          backgroundColor:
                              value == index
                                  ? Theme.of(context).primaryColor
                                  : isdark
                                  ? Colors.white12
                                  : Colors.black12,
                          label: Text(prudicSize[index]),
                          selected: value == index,
                          onSelected: (selected) {
                            currentIndex.value =
                                selected ? index : currentIndex.value;
                          },
                        ),
                      );
                    }),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Selecte Size", style: AppTextStyle.b2),
            ),
            Text(
              widget.data.desc,
              style: AppTextStyle.apply(
                textstyle: AppTextStyle.b2,
                color: isdark ? Colors.white60 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Buy now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
