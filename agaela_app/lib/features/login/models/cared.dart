class Cared {
  final int _id;
  final String _name;
  final String _lastName;
  final String _code;

  Cared(this._id, this._name, this._lastName, this._code);

  int get id => _id;

  String get name => _name;

  String get lastName => _lastName;

  String get code => _code;

  factory Cared.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['id'] as String);
    String name = json['nombre'] as String;
    String lastName = '${json['apellido1'] as String} ${json['apellido2']}';
    String code = json['codigo'] as String;
    return Cared(id, name, lastName, code);
  }
}
