class Province {
  final int _provinceCode;
  final String _provinceName;
  final int _countryCode;

  Province(this._provinceCode, this._provinceName, this._countryCode);

  int get provinceCode => _provinceCode;

  String get provinceName => _provinceName;

  int get countryCode => _countryCode;

  factory Province.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['id'] as String);
    String name = json['nombre'] as String;
    int fatherId = int.parse(json['idPadre'] as String);
    return Province(id, name, fatherId);
  }
}
