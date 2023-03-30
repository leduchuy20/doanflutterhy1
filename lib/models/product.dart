class Product {
  String image, title, des;
  int price, id;

  Product(
      {required this.id,
      required this.title,
      required this.des,
      required this.price,
      required this.image});
}

List<Product> products = [
  Product(
      id: 1,
      title: "title1",
      des: "des1",
      price: 232,
      image: "assets/images/spa1.png"),
  Product(
      id: 2,
      title: "title2",
      des: "des2",
      price: 232,
      image: "assets/images/spa1.png"),
  Product(
      id: 3,
      title: "title",
      des: "des3",
      price: 232,
      image: "assets/images/spa1.png"),
  Product(
      id: 4,
      title: "title4",
      des: "des4",
      price: 232,
      image: "assets/images/spa1.png"),
  Product(
      id: 5,
      title: "title5",
      des: "des5",
      price: 232,
      image: "assets/images/spa1.png"),
  Product(
      id: 6,
      title: "title6",
      des: "des6",
      price: 232,
      image: "assets/images/spa1.png")
];
