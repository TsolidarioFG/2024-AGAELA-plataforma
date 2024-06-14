import 'package:agaela_app/features/login/models/pending_form.dart';

class PendingFormCarer extends PendingForm {
  final int? _caredId;

  PendingFormCarer(this._caredId, super._formId, super._formText);

  int? get caredId => _caredId;

  factory PendingFormCarer.fromJson(Map<String, dynamic> json) {
    String partnerCode = json['data']['codigoSocio'] as String;
    String formCode = json['data']['codigoFormularioEscala'] as String;
    String text = json['texto'] as String;
    return PendingFormCarer(0, formCode, text);
  }
}
