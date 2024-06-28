// Mocks generated by Mockito 5.4.4 from annotations
// in agaela_app/test/utils/init_widget_dependencies.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart'
    as _i17;
import 'package:agaela_app/features/edit_password/services/edit_password_service.dart'
    as _i15;
import 'package:agaela_app/features/edit_profile/models/country.dart' as _i13;
import 'package:agaela_app/features/edit_profile/models/province.dart' as _i14;
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart'
    as _i3;
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart'
    as _i12;
import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart'
    as _i4;
import 'package:agaela_app/features/edit_social_procedures/models/dependency_model.dart'
    as _i7;
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart'
    as _i6;
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart'
    as _i5;
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart'
    as _i21;
import 'package:agaela_app/features/forms/models/question.dart' as _i18;
import 'package:agaela_app/features/login/models/cared.dart' as _i11;
import 'package:agaela_app/features/login/models/logged_user.dart' as _i2;
import 'package:agaela_app/features/login/models/pending_form.dart' as _i20;
import 'package:agaela_app/features/login/services/login_service.dart' as _i10;
import 'package:agaela_app/features/notifications/services/notifications_service.dart'
    as _i19;
import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart'
    as _i8;
import 'package:agaela_app/features/report_incident/services/report_incident_service.dart'
    as _i16;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLoggedUser_0 extends _i1.SmartFake implements _i2.LoggedUser {
  _FakeLoggedUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserProfileInformation_1 extends _i1.SmartFake
    implements _i3.UserProfileInformation {
  _FakeUserProfileInformation_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCardsAndIncomeModel_2 extends _i1.SmartFake
    implements _i4.CardsAndIncomeModel {
  _FakeCardsAndIncomeModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePermanentWorkDisabilityModel_3 extends _i1.SmartFake
    implements _i5.PermanentWorkDisabilityModel {
  _FakePermanentWorkDisabilityModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDisabilityModel_4 extends _i1.SmartFake
    implements _i6.DisabilityModel {
  _FakeDisabilityModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDependencyModel_5 extends _i1.SmartFake
    implements _i7.DependencyModel {
  _FakeDependencyModel_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PasswordRecoveryService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPasswordRecoveryService extends _i1.Mock
    implements _i8.PasswordRecoveryService {
  MockPasswordRecoveryService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> restorePassword(String? dni) => (super.noSuchMethod(
        Invocation.method(
          #restorePassword,
          [dni],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [LoginService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginService extends _i1.Mock implements _i10.LoginService {
  MockLoginService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.LoggedUser> login(
    String? dni,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            dni,
            password,
          ],
        ),
        returnValue: _i9.Future<_i2.LoggedUser>.value(_FakeLoggedUser_0(
          this,
          Invocation.method(
            #login,
            [
              dni,
              password,
            ],
          ),
        )),
      ) as _i9.Future<_i2.LoggedUser>);

  @override
  _i9.Future<List<_i11.Cared>> getCareds() => (super.noSuchMethod(
        Invocation.method(
          #getCareds,
          [],
        ),
        returnValue: _i9.Future<List<_i11.Cared>>.value(<_i11.Cared>[]),
      ) as _i9.Future<List<_i11.Cared>>);
}

/// A class which mocks [EditProfileService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditProfileService extends _i1.Mock
    implements _i12.EditProfileService {
  MockEditProfileService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.UserProfileInformation> getUserProfileInformation(
          String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserProfileInformation,
          [code],
        ),
        returnValue: _i9.Future<_i3.UserProfileInformation>.value(
            _FakeUserProfileInformation_1(
          this,
          Invocation.method(
            #getUserProfileInformation,
            [code],
          ),
        )),
      ) as _i9.Future<_i3.UserProfileInformation>);

  @override
  _i9.Future<void> setUserProfileInformation(
    String? code,
    _i3.UserProfileInformation? userInformation,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setUserProfileInformation,
          [
            code,
            userInformation,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<List<_i13.Country>> getCountries() => (super.noSuchMethod(
        Invocation.method(
          #getCountries,
          [],
        ),
        returnValue: _i9.Future<List<_i13.Country>>.value(<_i13.Country>[]),
      ) as _i9.Future<List<_i13.Country>>);

  @override
  _i9.Future<List<_i14.Province>> getProvinces(int? countryCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProvinces,
          [countryCode],
        ),
        returnValue: _i9.Future<List<_i14.Province>>.value(<_i14.Province>[]),
      ) as _i9.Future<List<_i14.Province>>);
}

/// A class which mocks [EditPasswordService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditPasswordService extends _i1.Mock
    implements _i15.EditPasswordService {
  MockEditPasswordService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> editPassword(
    String? oldPassword,
    String? newPassword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editPassword,
          [
            oldPassword,
            newPassword,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [ReportIncidentService].
///
/// See the documentation for Mockito's code generation for more information.
class MockReportIncidentService extends _i1.Mock
    implements _i16.ReportIncidentService {
  MockReportIncidentService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> reportIncident(
    String? code,
    String? name,
    String? incident,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #reportIncident,
          [
            code,
            name,
            incident,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [EditFunctionalStateService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditFunctionalStateService extends _i1.Mock
    implements _i17.EditFunctionalStateService {
  MockEditFunctionalStateService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i18.Question>> getFormQuestions(
    String? formId,
    Map<String, List<_i18.Question>?>? cachedQuestions,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFormQuestions,
          [
            formId,
            cachedQuestions,
          ],
        ),
        returnValue: _i9.Future<List<_i18.Question>>.value(<_i18.Question>[]),
      ) as _i9.Future<List<_i18.Question>>);

  @override
  _i9.Future<Map<String, String>?> getPreviousAnswers(
    String? formId,
    String? partnerCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPreviousAnswers,
          [
            formId,
            partnerCode,
          ],
        ),
        returnValue: _i9.Future<Map<String, String>?>.value(),
      ) as _i9.Future<Map<String, String>?>);

  @override
  _i9.Future<void> saveForm(
    String? formId,
    String? partnerCode,
    Map<String, String>? answers,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveForm,
          [
            formId,
            partnerCode,
            answers,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [NotificationsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotificationsService extends _i1.Mock
    implements _i19.NotificationsService {
  MockNotificationsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i20.PendingForm>> getNotifications(bool? carer) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNotifications,
          [carer],
        ),
        returnValue:
            _i9.Future<List<_i20.PendingForm>>.value(<_i20.PendingForm>[]),
      ) as _i9.Future<List<_i20.PendingForm>>);
}

/// A class which mocks [EditSocialProceduresService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditSocialProceduresService extends _i1.Mock
    implements _i21.EditSocialProceduresService {
  MockEditSocialProceduresService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<Map<String, String>> getHealthCardTypes() => (super.noSuchMethod(
        Invocation.method(
          #getHealthCardTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<Map<String, String>> getParkingCardTypes() => (super.noSuchMethod(
        Invocation.method(
          #getParkingCardTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<Map<String, String>> getNetIncomeCardTypes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNetIncomeCardTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<_i4.CardsAndIncomeModel> getCardsAndIncomeTypes(
    String? partnerCode,
    Map<String, String>? healthCardTypes,
    Map<String, String>? parkingCardTypes,
    Map<String, String>? netIncomeTypes,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCardsAndIncomeTypes,
          [
            partnerCode,
            healthCardTypes,
            parkingCardTypes,
            netIncomeTypes,
          ],
        ),
        returnValue: _i9.Future<_i4.CardsAndIncomeModel>.value(
            _FakeCardsAndIncomeModel_2(
          this,
          Invocation.method(
            #getCardsAndIncomeTypes,
            [
              partnerCode,
              healthCardTypes,
              parkingCardTypes,
              netIncomeTypes,
            ],
          ),
        )),
      ) as _i9.Future<_i4.CardsAndIncomeModel>);

  @override
  _i9.Future<_i4.CardsAndIncomeModel> getPreviousCardsAndIncomeAnswers(
          String? partnerCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPreviousCardsAndIncomeAnswers,
          [partnerCode],
        ),
        returnValue: _i9.Future<_i4.CardsAndIncomeModel>.value(
            _FakeCardsAndIncomeModel_2(
          this,
          Invocation.method(
            #getPreviousCardsAndIncomeAnswers,
            [partnerCode],
          ),
        )),
      ) as _i9.Future<_i4.CardsAndIncomeModel>);

  @override
  _i9.Future<void> setCardsAndIncome(
    String? partnerCode,
    _i4.CardsAndIncomeModel? cardsAndIncomeTypes,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCardsAndIncome,
          [
            partnerCode,
            cardsAndIncomeTypes,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<Map<String, String>> getProcessedTypes() => (super.noSuchMethod(
        Invocation.method(
          #getProcessedTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<Map<String, String>> getResolvedDisabilityTypes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getResolvedDisabilityTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<Map<String, String>> getUnresolvedProceduresTypes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUnresolvedProceduresTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<_i5.PermanentWorkDisabilityModel> getPermanentWorkDisabilityField(
    String? partnerCode,
    Map<String, String>? processedTypes,
    Map<String, String>? resolvedDisabilityTypes,
    Map<String, String>? unresolvedProceduresTypes,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPermanentWorkDisabilityField,
          [
            partnerCode,
            processedTypes,
            resolvedDisabilityTypes,
            unresolvedProceduresTypes,
          ],
        ),
        returnValue: _i9.Future<_i5.PermanentWorkDisabilityModel>.value(
            _FakePermanentWorkDisabilityModel_3(
          this,
          Invocation.method(
            #getPermanentWorkDisabilityField,
            [
              partnerCode,
              processedTypes,
              resolvedDisabilityTypes,
              unresolvedProceduresTypes,
            ],
          ),
        )),
      ) as _i9.Future<_i5.PermanentWorkDisabilityModel>);

  @override
  _i9.Future<_i5.PermanentWorkDisabilityModel>
      getPreviousPermanentWorkDisabilityAnswers(String? partnerCode) =>
          (super.noSuchMethod(
            Invocation.method(
              #getPreviousPermanentWorkDisabilityAnswers,
              [partnerCode],
            ),
            returnValue: _i9.Future<_i5.PermanentWorkDisabilityModel>.value(
                _FakePermanentWorkDisabilityModel_3(
              this,
              Invocation.method(
                #getPreviousPermanentWorkDisabilityAnswers,
                [partnerCode],
              ),
            )),
          ) as _i9.Future<_i5.PermanentWorkDisabilityModel>);

  @override
  _i9.Future<void> setPermanentWorkDisability(
    String? partnerCode,
    _i5.PermanentWorkDisabilityModel? permanentWorkDisability,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setPermanentWorkDisability,
          [
            partnerCode,
            permanentWorkDisability,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<_i6.DisabilityModel> getDisabilityFields(
    String? partnerCode,
    Map<String, String>? processedTypes,
    Map<String, String>? unresolvedProceduresTypes,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDisabilityFields,
          [
            partnerCode,
            processedTypes,
            unresolvedProceduresTypes,
          ],
        ),
        returnValue:
            _i9.Future<_i6.DisabilityModel>.value(_FakeDisabilityModel_4(
          this,
          Invocation.method(
            #getDisabilityFields,
            [
              partnerCode,
              processedTypes,
              unresolvedProceduresTypes,
            ],
          ),
        )),
      ) as _i9.Future<_i6.DisabilityModel>);

  @override
  _i9.Future<void> setDisability(
    String? partnerCode,
    _i6.DisabilityModel? disability,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDisability,
          [
            partnerCode,
            disability,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<_i6.DisabilityModel> getPreviousDisabilityAnswers(
          String? partnerCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPreviousDisabilityAnswers,
          [partnerCode],
        ),
        returnValue:
            _i9.Future<_i6.DisabilityModel>.value(_FakeDisabilityModel_4(
          this,
          Invocation.method(
            #getPreviousDisabilityAnswers,
            [partnerCode],
          ),
        )),
      ) as _i9.Future<_i6.DisabilityModel>);

  @override
  _i9.Future<_i7.DependencyModel> getDependencyFields(
    String? partnerCode,
    Map<String, String>? processedTypes,
    Map<String, String>? unresolvedProceduresTypes,
    Map<String, String>? dependencyLevelTypes,
    Map<String, String>? dependencyServicesTypes,
    Map<String, String>? dependencyOrdersOfPaymenTypes,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDependencyFields,
          [
            partnerCode,
            processedTypes,
            unresolvedProceduresTypes,
            dependencyLevelTypes,
            dependencyServicesTypes,
            dependencyOrdersOfPaymenTypes,
          ],
        ),
        returnValue:
            _i9.Future<_i7.DependencyModel>.value(_FakeDependencyModel_5(
          this,
          Invocation.method(
            #getDependencyFields,
            [
              partnerCode,
              processedTypes,
              unresolvedProceduresTypes,
              dependencyLevelTypes,
              dependencyServicesTypes,
              dependencyOrdersOfPaymenTypes,
            ],
          ),
        )),
      ) as _i9.Future<_i7.DependencyModel>);

  @override
  _i9.Future<Map<String, String>> getDependencyLevelsTypes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getDependencyLevelsTypes,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<Map<String, String>> getDependencyServices() =>
      (super.noSuchMethod(
        Invocation.method(
          #getDependencyServices,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<Map<String, String>> getDependencyOrdersOfPayment() =>
      (super.noSuchMethod(
        Invocation.method(
          #getDependencyOrdersOfPayment,
          [],
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<void> setDependency(
    String? partnerCode,
    _i7.DependencyModel? dependency,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDependency,
          [
            partnerCode,
            dependency,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<_i7.DependencyModel> getPreviousDependencyAnswers(
          String? partnerCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPreviousDependencyAnswers,
          [partnerCode],
        ),
        returnValue:
            _i9.Future<_i7.DependencyModel>.value(_FakeDependencyModel_5(
          this,
          Invocation.method(
            #getPreviousDependencyAnswers,
            [partnerCode],
          ),
        )),
      ) as _i9.Future<_i7.DependencyModel>);
}
