
import 'dart:convert';

import 'package:hacker_news/models/story.dart';
import 'package:http/http.dart' as http;

class WebService{

  final url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";


  Future<Story> _getStory(int storyId) async{


    final response = await http.get(Uri.http("https://hacker-news.firebaseio.com/", "v0/item/$storyId.json?print=pretty"));

    if(response.statusCode == 200){

      final json = jsonDecode(response.body);

      return Story.fromJson(json);

    }else{

      throw Exception("an error occurred");
    }
  }


  Future<List<Story>> getTopStories() async {

    final uri = Uri.http("https://hacker-news.firebaseio.com/", "v0/topstories.json?print=pretty", {'q':'{http}'});

   final response = await http.get(uri);

   if (response.statusCode == 200){

     Iterable storyIds = jsonDecode(response.body);
     print(storyIds);
     
     return Future.wait(storyIds.take(10).map((storyId){

       return _getStory(storyId);
     }));
   }else{

     throw Exception("an error has occurred");
   }

  }


}