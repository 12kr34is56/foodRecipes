import 'dart:convert';
import 'package:food_recipes/data/data_source/food/ingedient_json_data.dart';
import 'package:food_recipes/model/RecipeModels.dart';
import 'package:food_recipes/model/conversion_amount.dart';
import 'package:food_recipes/model/food_energy.dart';
import 'package:food_recipes/model/food_video_model.dart';
import 'package:food_recipes/model/nutrition_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipes/model/FoodModel.dart' as foodData;
import "package:food_recipes/model/dish_generated_models.dart";
import 'package:http/http.dart';

import '../model/chat_model.dart';
import '../model/dataModel.dart';
import '../model/food_substitute.dart';
import '../model/restaurant_menu_data_model.dart';
import '../model/search_model.dart';

class SpoonacularApi {
  // static String apiKey = '63ac5741201947a1a1fb09b04a7c5144';

  // static String apiKey = 'de81b45c63af46b9839c06c1a96664d8';

  // static String apiKey =  'dc514834a51644f8a7dfdf45217342a5';

  static String apiKey =  '5dc70b86caf94c8198a59b0d23751ff2';

  // static String apiKey = '3769427f0ce143238d38f24f052da166';

  // static String apiKey = 'bb6d78d3ed954aa4bd49fba357f35303';

  // static String apiKey =  '0e7c2ee4e9704feb8e917496d964b9eb';

  static Future<foodData.FoodModel> getFoodData(
      {String name = "", String cuisine = ""}) async {
    final response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?query=$name&addRecipeNutrition=true&cuisine=$cuisine&number=100&addRecipeInformation=true&apiKey=$apiKey"));
    // print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return foodData.FoodModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  static Future<List<SearchModel>> searchRecipes(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://api.spoonacular.com/recipes/autocomplete?number=25&query=$query&apiKey=$apiKey'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => SearchModel.fromJson(e)).toList();
    } else {
      // Handle error
      throw Exception(response.statusCode);
      print('Error: ${response.statusCode}');
    }
  }

  static Future<foodData.FoodModel> getSingleFoodData(
      {String name = "", String cuisine = ""}) async {
    final response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?query=$name&addRecipeNutrition=true&cuisine=$cuisine&number=1&addRecipeInformation=true&apiKey=$apiKey"));
    // print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return foodData.FoodModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  static Future<String> getRandomJokes() async {
    final response = await http.get(Uri.parse(
        "https://api.spoonacular.com/food/jokes/random?apiKey=$apiKey"));
    // print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['text'];
    } else {
      throw Exception("error");
    }
  }

  static Future<ChatModel> getChatBotAnswer({String text = ""}) async {
    final response = await http.get(Uri.parse(
        "https://api.spoonacular.com/food/converse?text=$text&apiKey=$apiKey"));
    // print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ChatModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  static Future<FoodSubstitute> getFoodSubstitute(
      {required String text}) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/food/ingredients/substitutes?ingredientName=$text&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final data = FoodSubstitute.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load food substitute');
    }
  }

  // static Future<List<FoodUser>> getFood({String name = ""}) async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.spoonacular.com/recipes/complexSearch?query=$name&apiKey=$apiKey'));
  //   print("Food User${response.body}");
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return List<FoodUser>.from(
  //         data['results'].map((x) => FoodUser.fromJson(x)));
  //   } else {
  //     throw Exception('Failed to load food');
  //   }
  // }

  static Future<List<FoodUser>> getDietFood({String diet = ""}) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$diet&apiKey=$apiKey&diet=$diet'));
    print("Food User${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<FoodUser>.from(
          data['results'].map((x) => FoodUser.fromJson(x)));
    } else {
      throw Exception('Failed to load food');
    }
  }

  static Future<AmountConversion> getFoodConvert(
      {String ingredientName = "",
      double sourceAmount = 0.0,
      String sourceUnit = "",
      String targetUnit = ""}) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/convert?ingredientName=$ingredientName&sourceAmount=$sourceAmount&sourceUnit=$sourceUnit&targetUnit=$targetUnit&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final data = AmountConversion.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load food');
    }
  }

  static Future<List<FoodUser>> getTypeFood(
      {String type = "", String maxReadyTime = ""}) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$type&apiKey=$apiKey&type=$type&maxReadyTime=$maxReadyTime'));
    print("Food User${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<FoodUser>.from(
          data['results'].map((x) => FoodUser.fromJson(x)));
    } else {
      throw Exception(response.statusCode);
    }
  }

  // static Future<FoodSummary> getFoodSummary(int id) async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.spoonacular.com/recipes/$id/summary?apiKey=$apiKey'));
  //   print("Food Summary ${response.body}");
  //   try {
  //     if (response.statusCode == 200) {
  //       final FoodSummary data =
  //           FoodSummary.fromJson(jsonDecode(response.body));
  //       print(data.id);
  //       return data;
  //     } else {
  //       throw Exception('Failed to fetch food summary: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error in getFoodSummary: $e');
  //   }
  // }

  // static Future<List<FoodUser>> getCuisineFood({String cuisine = ''}) async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.spoonacular.com/recipes/complexSearch?query=$cuisine&apiKey=$apiKey&number=100'));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return List<FoodUser>.from(
  //         data['results'].map((x) => FoodUser.fromJson(x)));
  //   } else {
  //     throw Exception('Failed to load food');
  //   }
  // }

  static Future<List<DishGeneratedModels>> getGeneratedDish(
      {List<String> dish = const []}) async {
    List<DishGeneratedModels> dishes = [];
    final ingredients = dish.join(",");
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/findByIngredients?ingredients=$ingredients&number=100&apiKey=$apiKey'));
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      dishes = data.map((e) => DishGeneratedModels.fromJson(e)).toList();
      for (var i in dishes) {
        print(i.title!);
      }
      return dishes;
    } else {
      throw Exception('Failed to load food');
    }
  }

  // static Future<FoodEnergy> getFoodEnergy({String dishName = ''}) async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.spoonacular.com/recipes/guessNutrition?title=$dishName&apiKey=$apiKey'));
  //   print("Food Energy${response.body}");
  //   if (response.statusCode == 200) {
  //     final data = FoodEnergy.fromJson(jsonDecode(response.body));
  //     return data;
  //   } else {
  //     throw Exception('Failed to load food');
  //   }
  // }

  static Future<NutritionModel> getNutritionOfDish(
      {String dishName = ""}) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/guessNutrition?title=$dishName&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final data = NutritionModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load food');
    }
  }

  static Future<FoodVideoModel> getDishVideo({String dishName = ""}) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/food/videos/search?query=$dishName&apiKey=$apiKey&number=1'));
    if (response.statusCode == 200) {
      final data = FoodVideoModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load food');
    }
  }

  static Future<List<RecipeModels>> getDishInstruction({int id = 0}) async {
    List<RecipeModels> dataInstruction = [];
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      int totalIngredients = 0;

      for (var recipe in data) {
        List<dynamic> steps = recipe['steps'];
        for (var step in steps) {
          List<dynamic> ingredients = step['ingredients'];
          totalIngredients += ingredients.length;
        }
      }

      print('Total number of ingredients: $totalIngredients');

      dataInstruction = data.map((e) => RecipeModels.fromJson(e)).toList();
      return dataInstruction;
    }
    throw Exception('Failed to load food');
  }

  // String getId(String name) {
  //   Map<String, dynamic> data = json.decode(ingredientJsonData);
  //
  //   // Convert the name to lowercase for case-insensitive comparison
  //   String lowercaseName = name.toLowerCase();
  //
  //   if (data.containsKey(lowercaseName)) {
  //     dynamic ingredientId = data[lowercaseName];
  //     print('Your id for $name is: $ingredientId');
  //     return '$ingredientId'; // You may want to return it as a String
  //   } else {
  //     print('$name not found.');
  //     return "not found"; // You might want to handle the case where the name is not found
  //   }
  // }
  static String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  //Api for fetching the restaurant menu
  static Future<List<Items>> restaurantFetchingApi(
      String lat, String lon) async {
    List<Items> restaurantData = [];

    try {
      Response response = await get(Uri.parse(
          "https://discover.search.hereapi.com/v1/discover?at=$lat,$lon&q=restaurant&apiKey=p1Q3nZ_Xew3pZpv1pf-U5jyOY4o6nrc4pnMYRxxp7Ys&limit=25"));
      // print(response.body);
      DataModel dataModel = dataModelFromJson(response.body);
      dataModel.items?.forEach((element) {
        restaurantData.add(element);
      });
      // print(restaurantData[0].id);
      return restaurantData;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Data> restaurantMenuFetchingApi(String name) async {
    var headers = {
      'X-RapidAPI-Key': '1f60bc4d70mshfec77f3c9a3b679p13bb31jsn7752c2ed4b9c',
      'X-RapidAPI-Host': 'foodiefetch.p.rapidapi.com',
    };
    return await get(
            Uri.parse("https://foodiefetch.p.rapidapi.com/swiggy?query=$name"),
            headers: headers)
        .then((value) =>
            RestaurantDataMenuModel.fromJson(jsonDecode(value.body)).data!);
  }
}

class FoodUser {
  int? id;
  String? title;
  String? image;

  FoodUser({this.id, this.title, this.image});

  factory FoodUser.fromJson(Map<String, dynamic> json) {
    return FoodUser(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

// class FoodSummary {
//   int id;
//   String title;
//   String summary;
//
//   FoodSummary({required this.id, required this.title, required this.summary});
//
//   factory FoodSummary.fromJson(Map<String, dynamic> json) {
//     return FoodSummary(
//       id: json['id'],
//       title: json['title'],
//       summary: SpoonacularApi.removeHtmlTags(json['summary']),
//     );
//   }
//
//
// }
