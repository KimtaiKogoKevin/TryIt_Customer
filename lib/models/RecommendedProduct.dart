class RecommendedProduct {
  String title;
  String subtitle;
  String price;
  String imageUrl;
  List<String> detailUrl;

  RecommendedProduct(this.title, this.subtitle, this.price, this.imageUrl, this.detailUrl);


  static List <RecommendedProduct> generateRecommendedProduct () {
    return [
      RecommendedProduct('Living Room Couch', 'Home and Decor', '\K\S\H500', 'assets/images/chair3.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      RecommendedProduct('Living Room Couch', 'Home and Decor', '\K\S\H500', 'assets/images/chair3.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),
      RecommendedProduct('Living Room Couch', 'Home and Decor', '\K\S\H500', 'assets/images/chair3.jpg', ['assets/images/chair1.jpg','assets/images/chair2.jpg']),


    ];
  }
}