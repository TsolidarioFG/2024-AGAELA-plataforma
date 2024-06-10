class Country {
  final int _countryCode;
  final String _countryName;

  Country(this._countryCode, this._countryName);

  int get countryCode => _countryCode;

  String get countryName => _countryName;

  factory Country.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['id'] as String);
    String name = json['nombre'] as String;
    return Country(id, name);
  }
}
