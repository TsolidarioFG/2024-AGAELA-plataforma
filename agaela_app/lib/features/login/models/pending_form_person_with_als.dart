import 'package:agaela_app/features/login/models/pending_form.dart';

class PendingFormPersonWithAls extends PendingForm {
  PendingFormPersonWithAls(super._formId);

  factory PendingFormPersonWithAls.fromJson(Map<String, dynamic> json) {
    String formCode = json['data']['codigoFormularioEscala'] as String;
    String text = json['texto'] as String;
    return PendingFormPersonWithAls(formCode);
  }
}
