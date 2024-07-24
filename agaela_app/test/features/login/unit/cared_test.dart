import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:test/test.dart';

void main() {
  const caredId = 2;
  const caredName = 'test2';
  const caredLastName = 'test3';
  const caredCode = 'testing2';

  List<Cared> careds = [];
  const id = 1;
  const name = 'test';
  List<PendingForm> pendingForms = [];
  const isCarer = true;
  const selectedId = caredId;
  const code = 'testing';

  late Carer carer;
  late Cared cared;

  setUp(() {
    cared = Cared(caredId, caredName, caredLastName, caredCode);
    careds.add(cared);
    carer = Carer(careds, id, name, pendingForms, isCarer, selectedId, code);
  });

  test('Carer isCarer should be true', () {
    expect(carer.isCarer, true);
  });

  test('Carer isCared method should be true', () {
    expect(carer.isCared(), true);
  });

  test('Carer isCarerAndNotCared method should be false', () {
    expect(carer.isCarerAndNotCared(), false);
  });

  test('Carer getActualCared method should be cared', () {
    expect(carer.getActualCared()!.id, cared.id);
  });

  test('Carer getActualCode method should be cared code', () {
    expect(carer.getActualCode(), caredCode);
  });

  test('Carer getCaredName method should be cared name', () {
    expect(carer.getCaredName(), caredName);
  });

  test('Carer from json method works correctly', () {
    String id = '1';
    String name = 'test';
    String code = 'testing';
    Map<String, dynamic> json = {'id': id, 'nombre': name, 'codigo': code};
    Carer example = Carer.fromJson(json, [], []);
    expect(example.id.toString(), id);
    expect(example.name, name);
    expect(example.code, code);
  });
}
