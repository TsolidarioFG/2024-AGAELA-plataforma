import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:test/test.dart';

void main() {
  List<Cared> careds = [];
  const id = 1;
  const name = 'test';
  List<PendingForm> pendingForms = [];
  const isCarer = true;
  const selectedId = 1;
  const code = 'testing';

  late Carer carer;

  setUp(() {
    carer = Carer(careds, id, name, pendingForms, isCarer, selectedId, code);
  });

  test('Carer isCarer should be true', () {
    expect(carer.isCarer, true);
  });

  test('Carer isCared method should be false', () {
    expect(carer.isCared(), false);
  });

  test('Carer isCarerAndNotCared method should be true', () {
    expect(carer.isCarerAndNotCared(), true);
  });

  test('Carer getActualCared method should be null', () {
    expect(carer.getActualCared(), null);
  });

  test('Carer getActualCode method should work correctly', () {
    expect(carer.getActualCode(), code);
  });

  test('Carer getCaredName method should be empty', () {
    String nameExpected = '';
    expect(carer.getCaredName(), nameExpected);
  });
}
