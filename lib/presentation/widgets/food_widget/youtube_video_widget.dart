import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoWidget extends StatelessWidget {
  const YoutubeVideoWidget({
    super.key,
    required this.height,
    required this.width,
    required this.title,
  });

  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SpoonacularApi.getDishVideo(dishName: title),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Handle error more gracefully, log or display specific error message.
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data == null || snapshot.data!.totalResults == 0) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.pink, width: 1.2)),
              height: height * 0.22,
              width: width * 0.93,
              child: Center(child: Icon(Icons.error, color: Colors.pink)));
        } else {
          return SizedBox(
            width: width * 0.9,
            child: Column(
              children: [
                for (var data in snapshot.data!.videos!)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: YoutubePlayer(
                      aspectRatio: 16 / 9,
                      controller: YoutubePlayerController(
                        initialVideoId: data.youTubeId!,
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                          showLiveFullscreenButton: false,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          );
        }
      },
    );
  }
}
