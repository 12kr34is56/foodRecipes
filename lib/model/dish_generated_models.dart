import 'MissedIngredients.dart';
import 'UsedIngredients.dart';
import 'UnusedIngredients.dart';

class DishGeneratedModels {
  DishGeneratedModels({
      this.id, 
      this.title, 
      this.image, 
      this.imageType, 
      this.usedIngredientCount, 
      this.missedIngredientCount, 
      this.missedIngredients, 
      this.usedIngredients, 
      this.unusedIngredients, 
      this.likes,});

  DishGeneratedModels.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    usedIngredientCount = json['usedIngredientCount'];
    missedIngredientCount = json['missedIngredientCount'];
    if (json['missedIngredients'] != null) {
      missedIngredients = [];
      json['missedIngredients'].forEach((v) {
        missedIngredients!.add(MissedIngredients.fromJson(v));
      });
    }
    if (json['usedIngredients'] != null) {
      usedIngredients = [];
      json['usedIngredients'].forEach((v) {
        usedIngredients!.add(UsedIngredients.fromJson(v));
      });
    }
    if (json['unusedIngredients'] != null) {
      unusedIngredients = [];
      json['unusedIngredients'].forEach((v) {
        unusedIngredients!.add(UnusedIngredients.fromJson(v));
      });
    }
    likes = json['likes'];
  }
  int? id;
  String? title;
  String? image;
  String? imageType;
  int ?usedIngredientCount;
  int ?missedIngredientCount;
  List<MissedIngredients?>? missedIngredients;
  List<UsedIngredients?>? usedIngredients;
  List<UnusedIngredients?>? unusedIngredients;
  int? likes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['imageType'] = imageType;
    map['usedIngredientCount'] = usedIngredientCount;
    map['missedIngredientCount'] = missedIngredientCount;
    if (missedIngredients != null) {
      map['missedIngredients'] = missedIngredients!.map((v) => v!.toJson()).toList();
    }
    if (usedIngredients != null) {
      map['usedIngredients'] = usedIngredients!.map((v) => v!.toJson()).toList();
    }
    if (unusedIngredients != null) {
      map['unusedIngredients'] = unusedIngredients!.map((v) => v!.toJson()).toList();
    }
    map['likes'] = likes;
    return map;
  }

}