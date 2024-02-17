class MissedIngredients {
  MissedIngredients({
      this.id, 
      this.amount, 
      this.unit, 
      this.unitLong, 
      this.unitShort, 
      this.aisle, 
      this.name, 
      this.original, 
      this.originalName, 
      this.meta, 
      this.image,});

  MissedIngredients.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    meta = json['meta'] != null ? json['meta'].cast<String>() : [];
    image = json['image'];
  }
  int ?id;
  double ?amount;
  String ?unit;
  String ?unitLong;
  String ?unitShort;
  String ?aisle;
  String ?name;
  String ?original;
  String ?originalName;
  List<String?>? meta;
  String? image;

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
    map['meta'] = meta;
    map['image'] = image;
    return map;
  }

}