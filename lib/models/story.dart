


class Story {

  String title;
  String url;

  Story({this.title, this.url});

  factory Story.fromJson(Map<String, dynamic> json){

    return Story(
      title: json["title"],
      url: json["url"]
    );
  }
}