class TipsModel {
  TipsModel({
    required this.data,
  });
  late final List<ListTips> data;

  TipsModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => ListTips.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ListTips {
  int id;
  String text;
  String author;
  List<dynamic> upvotes;
  List<dynamic> downvotes;
  late final List<ListTips> data;
  ListTips(
      {required this.id,
      required this.text,
      required this.author,
      required this.upvotes,
      required this.downvotes});

  factory ListTips.fromJson(Map<String, dynamic> json) {
    return ListTips(
        id: json['id'] as int,
        text: json['text'] as String,
        author: json['author'] as String,
        upvotes: List<dynamic>.from(json['upvotes'] as List<dynamic>),
        downvotes: List<dynamic>.from(json['downvotes'] as List<dynamic>));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['text'] = text;
    _data['author'] = author;
    _data['upvotes'] = upvotes;
    _data['downvotes'] = downvotes;
    return _data;
  }
}