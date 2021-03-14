
import 'package:flutter/material.dart';
import 'package:hacker_news/services/web_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WebService().getTopStories();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
      ),
      body: Text("Top stories will go here"),
    );
  }
}
