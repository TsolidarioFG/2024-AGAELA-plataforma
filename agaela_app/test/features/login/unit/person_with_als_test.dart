import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/person_with_als.dart';
import 'package:test/test.dart';

void main() {
  const id = 1;
  const name = 'test';
  List<PendingForm> pendingForms = [];
  const isCarer = false;
  const selectedId = 1;
  const code = 'testing';

  late PersonWithAls personWithAls;

  setUp(() {
    personWithAls =
        PersonWithAls(id, name, pendingForms, isCarer, selectedId, code);
  });

  test('Person with ALS isCarer should be false', () {
    expect(personWithAls.isCarer, false);
  });

  test('Person with ALS isCared method should be false', () {
    expect(personWithAls.isCared(), false);
  });

  test('Person with ALS isCarerAndNotCared method should be false', () {
    expect(personWithAls.isCarerAndNotCared(), false);
  });

  test('Person with ALS getActualCared method should be null', () {
    expect(personWithAls.getActualCared(), null);
  });

  test('Person with ALS getActualCode method should work correctly', () {
    expect(personWithAls.getActualCode(), code);
  });

  test('Person with ALS getCaredName method should be empty', () {
    String nameExpected = '';
    expect(personWithAls.getCaredName(), nameExpected);
  });
}
