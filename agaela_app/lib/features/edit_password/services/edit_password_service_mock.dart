import 'package:agaela_app/features/edit_password/services/edit_password_service.dart';

class EditPasswordServiceMock implements EditPasswordService {
  @override
  Future<void> editPassword(String oldPassword, String newPassword) async {
    const errorText = 'error';
    await Future.delayed(const Duration(seconds: 1));
    if (oldPassword == errorText) throw Exception();
  }
}
