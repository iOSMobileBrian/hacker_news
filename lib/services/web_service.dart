import 'dart:convert';

import 'package:hacker_news/models/story.dart';
import 'package:http/http.dart' as http;

class WebService {
  final url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";

  Future<List<Story>> getStories(Iterable<int> storyIds) async {
    final futures = storyIds.map((id) async {
      try {
        final idUrl = "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty";
        final response = await http.get(Uri.parse(idUrl));
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          return Story.fromJson(json);
        } else {
          throw Exception("Error fetching story with ID $id: ${response.statusCode}");
        }
      } catch (e) {
        print("Error fetching story with ID $id: ${e.toString()}");
        return null;
      }
    }).toList();

    final results = await Future.wait(futures);
    return results.whereType<Story>().toList();
  }

  Future<List<Story>> getTopStories() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      Iterable<int> ids = storyIds.take(10).map((e) => (e as int));
      print(ids);
      final storyList = getStories(ids);
      return storyList;
    } else {
      throw Exception('Failed to load stories');
    }
  }
}
