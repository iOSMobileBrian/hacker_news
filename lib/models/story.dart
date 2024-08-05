class Story {
  String title;
  String url;

  Story({required this.title, required this.url});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(title: json["title"]?? '', url: json["url"] ?? '');
  }

  @override
  String toString() {
    return 'Story{title: $title, url: $url}';
  }
}
