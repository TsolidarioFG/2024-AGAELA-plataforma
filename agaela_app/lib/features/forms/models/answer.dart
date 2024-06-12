class Answer {
  final int _id;
  final String _code;
  final String _text;

  Answer(this._id, this._code, this._text);

  int get id => _id;

  String get code => _code;

  String get text => _text;

  factory Answer.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['id'] as String);
    String code = json['codigo'] as String;
    String text = json['texto'] as String;
    return Answer(id, code, text);
  }
}
