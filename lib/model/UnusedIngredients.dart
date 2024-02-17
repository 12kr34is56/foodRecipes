class UnusedIngredients {
  UnusedIngredients({
      this.id, 
      this.amount, 
      this.unit, 
      this.unitLong, 
      this.unitShort, 
      this.aisle, 
      this.name, 
      this.original, 
      this.originalName,
      this.image,});

  UnusedIngredients.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];

    image = json['image'];
  }
  int? id;
  double? amount;
  String ?unit;
  String ?unitLong;
  String ?unitShort;
  String ?aisle;
  String ?name;
  String ?original;
  String ?originalName;
  String ?image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['amount'] = amount;
    map['unit'] = unit;
    map['unitLong'] = unitLong;
    map['unitShort'] = unitShort;
    map['aisle'] = aisle;
    map['name'] = name;
    map['original'] = original;
    map['originalName'] = originalName;
    map['image'] = image;
    return map;
  }

}