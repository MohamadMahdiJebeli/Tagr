// ignore_for_file: file_names

class Hashtag{
  String title;

  Hashtag({required this.title});
}

class BlogModelfake {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogModelfake({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writer,
    required this.writerImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}

class PodcastModel {
  int id;
  String imageUrl;
  String title;
  String speaker;
  String writerImageUrl;
  String date;
  String content;
  String views;

  PodcastModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.speaker,
    required this.writerImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}
