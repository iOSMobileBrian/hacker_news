import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/ViewModel/hacker_news_list_view.dart';

import '../models/story.dart';

final newsStoryProvider =
AsyncNotifierProvider<HackerNewsListView, List<Story>>(HackerNewsListView.new);