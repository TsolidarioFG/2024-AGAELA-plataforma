# AGAELA APP objective

Create a user interface (UI) adapted to people with ALS, allowing them to send periodic forms called functional rating scale and barthel index to [AGAELA](https://agaela.es/).

To simplify the process, the app will manage periodic notifications reminding users to fill out the forms.

Additionally, the app will allow users change their personal information, perform social procedures and report incidents.

Finally, it is important to note that the information of a person with ALS can be managed by his carer, so the UI will change if the user logged in is a carer. A carer can manage the information of one or more people with ALS and must fill out a specific periodic form called caregiver overload.

## AGAELA APP Project Structure

All the code of the app is under the `lib` directory and follows the Feature-first project structure. This structure organizes the code around features. For example:

features
- login
- password_recovery
- ...

Inside each feature are four more divisions:

- models (all the objects)
- screens (all the "visible" part of the app)
- services (all the requests, with interfaces and implementations)
- widgets (small parts of the UI to follow divide and conquer logic)

Additionally, there are more folders and files outside the `features` folder to support this structure:

- common_widgets: Common widgets used in two or more features
- constants: Constants commonly used in all / some features
- l10n: All the localization of the app (spanish and galician)
- routing: All the routing of the app to navigate through screens easily
- utils: Reusable code in various parts of the project
- app.dart: Basic configuration of the app like configuring routing
- locators.dart: Utility to implement dependency injection
- main.dart: Initializes the app

## AGAELA APP building and execution

To run this app you will need [flutter](https://docs.flutter.dev/get-started/install).

Once it is installed, go to the agaela_app folder and run: `flutter run`