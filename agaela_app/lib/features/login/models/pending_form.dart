abstract class PendingForm {
  final String _formId;

  final String _formText;

  PendingForm(this._formId, this._formText);

  String get formId => _formId;
}
