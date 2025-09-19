import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/home_screen.dart'
    show prudicgrid;
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class AllPrudictScreen extends StatelessWidget {
  const AllPrudictScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("All Prudict", style: AppTextStyle.h3),
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
      body: const Padding(padding: EdgeInsets.all(8.0), child: prudicgrid()),
    );
  }
}

class FilterPrudict {
  static void show(final BuildContext context) {
    final bool isdark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      context: context,
      builder:
          (final context) => StatefulBuilder(
            builder: (final context, final setState) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Filter Prudict", style: AppTextStyle.h3),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text("Price Range"),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Min",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Max",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text("Catogary", style: AppTextStyle.b2),
                      SizedBox(height: 5),
                      Wrap(
                        spacing: 8,
                        children:
                            [
                                  "All",
                                  "shoes",
                                  "Clothing",
                                  "Accessories",
                                  "Bags",
                                  "Eelctronic",
                                ]
                                .map(
                                  (final catogare) => choiceChip(
                                    context: context,
                                    label: Text(
                                      catogare,
                                      style: AppTextStyle.apply(
                                        textstyle: AppTextStyle.b2,
                                        color:
                                            isdark
                                                ? Colors.white
                                                : Colors.black,
                                        fwight: FontWeight.w500,
                                      ),
                                    ),
                                    selected: catogare == "All",
                                    onSelected: (p0) {},
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Apply Filter",
                            style: AppTextStyle.apply(
                              textstyle: AppTextStyle.b1,
                              color: Colors.white,
                              letterspacing: 1.9,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}

ChoiceChip choiceChip({
  required Widget label,
  required bool selected,
  void Function(bool)? onSelected,
  required BuildContext context,
}) {
  return ChoiceChip(
    label: label,
    selected: selected,
    onSelected: onSelected,
    selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.5),
    backgroundColor: Theme.of(context).cardColor,
  );
}
