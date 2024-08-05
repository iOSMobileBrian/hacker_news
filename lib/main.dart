import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/Pages/home_page.dart';
import 'package:hacker_news/Providers/providers.dart';
import 'package:hacker_news/services/web_service.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(

    ),
  ));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stories = ref.watch(newsStoryProvider);
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: stories.when(
          data: (stories)=> HomePage(),
          error: (error, _)=> HomePage(),
          loading: ()=> Center(child: CircularProgressIndicator(),)),
    );
  }
}

