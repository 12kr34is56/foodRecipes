import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:http/http.dart' as http;

import '../../../model/chat_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // static String apiKey = '3769427f0ce143238d38f24f052da166';
  TextEditingController _messageController = TextEditingController();
  List<ChatModel> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("Chat with Bot"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                ChatModel chatModel = _messages[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        chatModel.answerText ?? "",
                      ),
                    ),
                    SizedBox(height: 10,),
                    if (chatModel.media != null)
                      ...chatModel.media!.map((media) => Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(media.image ?? "")),
                                      Flexible(child: Text(media.title ?? "",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                      )),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 18),
                    ),
                    fixedSize: MaterialStateProperty.all(Size(90, 50)),
                  ),
                  onPressed: () async {
                    String message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      await SpoonacularApi.getChatBotAnswer(text: message)
                          .then((value) {
                        setState(() {
                          _messages.add(value);
                        });
                      });
                      // Clear the text field after sending the message
                      _messageController.clear();
                    }
                  },
                  child: Text("Send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
