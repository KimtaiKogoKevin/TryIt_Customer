class Product {
  String title;
  String subtitle;
  String price;
  String imageUrl;
  List<String> detailUrl;

  Product(this.title, this.subtitle, this.price, this.imageUrl, this.detailUrl);


  static List <Product> generateProduct () {
    return [
      Product('Product Title', 'Product SubTitle', '\K\S\H500', 'assets/images/chair1.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      Product('Product Title', 'Product SubTitle', '\K\S\H500', 'assets/images/chair1.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      Product('Product Title', 'Product SubTitle', '\K\S\H500', 'assets/images/chair1.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      Product('Product Title', 'Product SubTitle', '\K\S\H500', 'assets/images/chair1.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      Product('Product Title', 'Product SubTitle', '\K\S\H500', 'assets/images/chair1.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      Product('Product Title', 'Product SubTitle', '\K\S\H500', 'assets/images/chair1.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),

    ];
  }
}