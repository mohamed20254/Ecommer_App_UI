import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/model/notivication_model.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class NotivigatonScreen extends StatelessWidget {
  const NotivigatonScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Notification ", style: AppTextStyle.h3),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Mark all as read",
              style: AppTextStyle.apply(
                textstyle: AppTextStyle.b3,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: notivigatonList.length,
          itemBuilder: (final context, final index) {
            return Container(
              decoration: BoxDecoration(
                color:
                    notivigatonList[index].isreaed
                        ? Theme.of(context).cardColor
                        : Theme.of(context).primaryColor.withValues(alpha: 0.1),
              ),
              child: ListTile(
                title: Text(notivigatonList[index].title),
                subtitle: Text(notivigatonList[index].messige),
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _notivigationcolor(notivigatonList[index].type),
                    shape: BoxShape.circle,
                  ),
                  child: _notifiIcons(notivigatonList[index].type),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _notivigationcolor(final NotivigationType type) {
    switch (type) {
      case NotivigationType.order:
        return Colors.red.withValues(alpha: 0.2);
      case NotivigationType.delivery:
        return Colors.blue.withValues(alpha: 0.2);

      case NotivigationType.payment:
        return Colors.green.withValues(alpha: 0.2);

      case NotivigationType.promo:
        return Colors.orange.withValues(alpha: 0.2);
    }
  }

  Icon _notifiIcons(final NotivigationType type) {
    switch (type) {
      case NotivigationType.order:
        return const Icon(Icons.shopping_bag_outlined, color: Colors.red);
      case NotivigationType.delivery:
        return const Icon(Icons.delivery_dining, color: Colors.blue);
      case NotivigationType.payment:
        return const Icon(Icons.payment, color: Colors.green);
      case NotivigationType.promo:
        return const Icon(
          Icons.precision_manufacturing_outlined,
          color: Colors.orange,
        );
    }
  }
}
