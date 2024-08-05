
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/Providers/providers.dart';
import 'package:hacker_news/services/web_service.dart';

import '../models/story.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stories = ref.watch(newsStoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: stories.value?.length,
          itemBuilder: (context, index){
            final story = stories.value?[index];
            return Container(
              height: 40,
              width: MediaQuery.sizeOf(context).width,
              child: Text('${story?.title}',softWrap: true,),
            );
          }),
    );
  }
}
