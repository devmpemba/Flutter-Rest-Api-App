class Fruit {

  //variables definition
  final int id;
  final String title;
  final String imgUrl;
  final int quantity;

  //constructor
  Fruit(
      this.id,
      this.title,
      this.imgUrl,
      this.quantity,
      );

  factory Fruit.fromMap(Map<String, dynamic> json) {
    return Fruit(json['id'], json['title'], json['imgUrl'], json['quantity']);
  }

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(json['id'], json['title'], json['imgUrl'], json['quantity']);
  }
}