enum NotivigationType { order, delivery, promo, payment }

class Notivigatonitem {
  final String title;
  final String messige;
  final String time;
  final NotivigationType type;
  final bool isreaed;
  Notivigatonitem({
    required this.title,
    required this.messige,
    required this.time,
    required this.type,
    required this.isreaed,
  });
}

List<Notivigatonitem> notivigatonList = [
  Notivigatonitem(
    title: "Order Confirmed",
    messige: "Your order #1234 has been confirmed successfully.",
    time: "10:30 AM",
    type: NotivigationType.order,
    isreaed: true,
  ),
  Notivigatonitem(
    title: "Out for Delivery",
    messige: "Your package is on its way and will arrive soon.",
    time: "11:45 AM",
    type: NotivigationType.delivery,
    isreaed: false,
  ),
  Notivigatonitem(
    title: "Promo Offer",
    messige: "Get 20% off on your next order. Limited time offer!",
    time: "Yesterday",
    type: NotivigationType.promo,
    isreaed: true,
  ),
  Notivigatonitem(
    title: "Payment Successful",
    messige: "Your payment of \$250 has been received.",
    time: "Aug 29, 2025",
    type: NotivigationType.payment,
    isreaed: true,
  ),
  Notivigatonitem(
    title: "Order Shipped",
    messige: "Your order #1234 has been shipped with tracking ID TRK123.",
    time: "Aug 28, 2025",
    type: NotivigationType.delivery,
    isreaed: false,
  ),
];
