class Province {
  final int _provinceCode;
  final String _provinceName;
  final int _countryCode;

  Province(this._provinceCode, this._provinceName, this._countryCode);

  int get provinceCode => _provinceCode;

  String get provinceName => _provinceName;

  int get countryCode => _countryCode;
}
