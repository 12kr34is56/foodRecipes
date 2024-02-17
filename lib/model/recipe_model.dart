class RecipeModel {
  final String? name;
  final int? number;

  RecipeModel({required this.name, required this.number});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['name'],
      number: json['steps']['number']
    );
  }
}
