import 'package:agaela_app/features/login/models/pending_form.dart';

class PendingFormCarer extends PendingForm {
  final String? _partnerCode;

  PendingFormCarer(this._partnerCode, super._formId, super._formText);

  String? get partnerCode => _partnerCode;

  factory PendingFormCarer.fromJson(Map<String, dynamic> json) {
    String partnerCode = json['data']['codigoSocio'] as String;
    String formCode = json['data']['codigoFormularioEscala'] as String;
    String text = json['texto'] as String;
    return PendingFormCarer(partnerCode, formCode, text);
  }
}
