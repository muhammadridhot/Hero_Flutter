class HeroModel {
  int id;
  String name;
  int hp;
  int damage;
  int armor;
  String title;
  String classHero;

  HeroModel({this.id, this.name, this.hp, this.damage, this.armor, this.title,this.classHero});

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'],
      hp: json['hp'],
      damage: json['damage'],
      armor: json['armor'],
      title: json['title'],
      classHero:json['classHero']
    );
  }
}
