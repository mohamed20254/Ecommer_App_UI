import 'package:fluttertest/ecomerApp1/utils/constant.dart';

class PrudicModel {
  final String name, desc, image, catogary;
  final double price;
  final double? oldprice;
  final bool isfav;
  PrudicModel({
    this.oldprice,
    required this.name,
    required this.desc,
    required this.image,
    required this.catogary,
    required this.price,
    this.isfav = false,
  });
}

final List<PrudicModel> pruductList = [
  PrudicModel(
    oldprice: 189.00,

    name: "shose",
    desc: "This the description of the prudct 1",
    image: Appimages.shose,
    catogary: "foatwear",
    price: 69.00,
  ),
  PrudicModel(
    oldprice: 189.00,
    isfav: true,
    name: "laptop",
    desc: "This the description of the prudct 2",
    image: Appimages.laptop,
    catogary: "Electrnics",
    price: 98.00,
  ),
  PrudicModel(
    oldprice: 189.00,

    name: "jourdan shose",
    desc: "This the description of the prudct 3",
    image: Appimages.shos1,
    catogary: "foatwear",
    price: 69.00,
  ),
  PrudicModel(
    oldprice: 189.00,
    isfav: true,
    name: "puma",
    desc: "This the description of the prudct 3",
    image: Appimages.shose2,
    catogary: "foatwear",
    price: 69.00,
  ),
];
