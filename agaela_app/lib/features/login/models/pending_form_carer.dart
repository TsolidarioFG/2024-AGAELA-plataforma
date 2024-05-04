import 'package:agaela_app/features/login/models/pending_form.dart';

class PendingFormCarer extends PendingForm {
  final int _caredId;

  PendingFormCarer(this._caredId, super._formId);

  int get caredId => _caredId;
}
