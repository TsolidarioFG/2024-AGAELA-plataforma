import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/models/cached_questions.dart';
import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';

LoggedUserProvider getFakeCarer() {
  Cared cared = Cared(2, 'test2', 'test2', 'code');
  List<Cared> careds = [cared];
  int id = 1;
  String name = 'test';
  List<PendingForm> pendingForms = [];
  bool isCarer = true;
  int selectedId = 2;
  String code = 'test';
  LoggedUserProvider loggedUserProvider = LoggedUserProvider();
  loggedUserProvider.setLoggedUser(
      Carer(careds, id, name, pendingForms, isCarer, selectedId, code));
  return loggedUserProvider;
}

UserProfileInformationProvider getFakeUserProfileInformation() {
  String name = 'test';
  String lastName1 = 'test';
  String lastName2 = 'test2';
  String dni = '11111111A';
  DateTime birthDate = DateTime.now();
  List<int> telephoneNumbers = [];
  List<String> emails = [];
  String iban = '';
  int feeAmount = 1;
  bool acceptSendNews = false;
  bool acceptLegalNotice = false;
  Country country = Country(1, 'Spain');
  Province province = Province(2, 'A Coruña', 1);
  String city = 'A Coruña';
  String postalCode = '11111';
  String address = 'aa';
  String profession = 'b';
  UserProfileInformationProvider userProfileInformation =
      UserProfileInformationProvider();
  userProfileInformation.setUserProfileInformation(UserProfileInformation(
      name,
      lastName1,
      lastName2,
      dni,
      birthDate,
      telephoneNumbers,
      emails,
      iban,
      feeAmount,
      acceptSendNews,
      acceptLegalNotice,
      country,
      province,
      city,
      postalCode,
      address,
      profession));
  return userProfileInformation;
}

ActualFormProvider getFakeActualForm() {
  String formId = barthelIndexFormId;
  String title = 'barthel index';
  List<Question> questions = [];
  ActualFormProvider actualFormProvider = ActualFormProvider();
  actualFormProvider.setActualForm(ActualForm(formId, title, questions));
  return actualFormProvider;
}

CachedQuestions getFakeCachedQuestions() {
  return CachedQuestions();
}

EditSocialProceduresSavedTypes getFakeEditSocialProceduresSavedTypes() {
  EditSocialProceduresSavedTypes editSocialProceduresSavedTypes =
      EditSocialProceduresSavedTypes();
  Map<String, String> example = {'1': 'A', '2': 'B'};
  editSocialProceduresSavedTypes.dependencyLevelsTypes = example;
  editSocialProceduresSavedTypes.dependencyOrdersOfPayment = example;
  editSocialProceduresSavedTypes.dependencyServices = example;
  editSocialProceduresSavedTypes.healthCardTypes = example;
  editSocialProceduresSavedTypes.netIncomeTypes = example;
  editSocialProceduresSavedTypes.parkingCardTypes = example;
  editSocialProceduresSavedTypes.processedTypes = example;
  editSocialProceduresSavedTypes.resolvedDisabilityTypes = example;
  editSocialProceduresSavedTypes.unresolvedProceduresTypes = example;
  return editSocialProceduresSavedTypes;
}
