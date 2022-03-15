
class Category {

  String title;
  String imageUrl;

  Category(this.title , this.imageUrl);

  static List <Category> generateCategory () {
    return [

      Category('Home and Decor', 'assets/images/homedecor.png'),
      Category('Kitchenware', 'assets/images/kitchenware.png'),
      Category('Office', 'assets/images/office.png'),
      Category('Kids Toys', 'assets/images/toys.png'),




    ];
  }

}
