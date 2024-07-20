import 'package:agaela_app/common_widgets/agaela_image_appbar.dart';
import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:agaela_app/features/notifications/services/notifications_service.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:agaela_app/utils/string_utils.dart';
import 'package:agaela_app/utils/token_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final double height = 10.0;

  final LoginService _loginService = locator<LoginService>();
  final NotificationsService _notificationsService =
      locator<NotificationsService>();

  final _loginFormKey = GlobalKey<FormState>();

  final _dniController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<LoggedUser>? _request;

  void _loginWithToken(VoidCallback routeOnSuccess) {
    setState(() {
      _request = _loginService.loginWithToken();
      _request!.then((loggedUser) {
        Provider.of<LoggedUserProvider>(context, listen: false)
            .setLoggedUser(loggedUser);
        routeOnSuccess();
      }, onError: (_) => {});
    });
  }

  Future<void> onBackgroundMessage(RemoteMessage message) async {
    String? token = await getToken();
    if (token != null) {
      _loginWithToken(
          () => context.goNamed(RoutesNames.notificationsHome.name));
    }
  }

  @override
  void initState() {
    super.initState();
    _notificationsService.initNotifications(onBackgroundMessage);
    _loginWithToken(() => goToHome(context));
  }

  void _startLogin() {
    setState(() {
      _request =
          _loginService.login(_dniController.text, _passwordController.text);
      _request!.then(
          (loggedUser) => {
                Provider.of<LoggedUserProvider>(context, listen: false)
                    .setLoggedUser(loggedUser),
                loggedUser.isCarer
                    ? context.goNamed(RoutesNames.carerHome.name)
                    : context.goNamed(RoutesNames.home.name)
              },
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.no_encryption),
              AppLocalizations.of(context)!.loginErrorDescription,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgaelaImageAppbar(),
      body: Form(
          key: _loginFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ScrolleableWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: height,
                ),
                DefaultIconFormField(
                  controller: _dniController,
                  icon: const Icon(Icons.perm_identity),
                  text: AppLocalizations.of(context)!.loginDniField,
                  sensitiveInformation: false,
                  validator: (String? dni) {
                    return !dni!.isValidDni
                        ? AppLocalizations.of(context)!.errorDniNotValid
                        : null;
                  },
                ),
                SizedBox(
                  height: height,
                ),
                DefaultIconFormField(
                  controller: _passwordController,
                  icon: const Icon(Icons.lock),
                  text: AppLocalizations.of(context)!.loginPasswordField,
                  sensitiveInformation: true,
                  validator: (String? password) {
                    return !password!.isValidPassword
                        ? AppLocalizations.of(context)!.errorPasswordNotValid
                        : null;
                  },
                ),
                SizedBox(
                  height: height,
                ),
                FutureBuilder(
                    future: _request,
                    builder: (BuildContext context,
                            AsyncSnapshot<LoggedUser> snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? const CircularProgressIndicator()
                            : DefaultButton(
                                function: () => {
                                      if (_loginFormKey.currentState!
                                          .validate())
                                        _startLogin()
                                    },
                                text:
                                    AppLocalizations.of(context)!.loginButton)),
                SizedBox(
                  height: height,
                ),
                TextButton(
                    onPressed: () =>
                        context.goNamed(RoutesNames.passwordRecovery.name),
                    child: Text(
                        AppLocalizations.of(context)!.loginPasswordRecovery))
              ],
            ),
          )),
    );
  }
}
