

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/services/web_service.dart';

import '../models/story.dart';

class HackerNewsListView extends AsyncNotifier<List<Story>>{
  @override
  FutureOr<List<Story>> build() async {
    final storyList = await getAll();
    return storyList;
  }

  Future<List<Story>> getAll() async{
    state = const AsyncLoading();
    List<Story> newsStory = await WebService().getTopStories();
    return newsStory;

  }

}