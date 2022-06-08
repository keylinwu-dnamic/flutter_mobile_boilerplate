
  
# 👋 Welcome to Flutter Boilerplate Project 
This readme file describes all elements necessary in order to understand the general structure of the project, as well as the required information to get started and collaborate.  
  
# 1) 📝 Name Convention and other rules.  
  
This section defines some Flutter and Dart naming conventions, which are split into several sections.  
  
## Flutter Analyze and others  
  
- If you run from the command line, test your code with  `flutter analyze`.  
  
The Dart analyzer makes heavy use of type annotations that you put in your code to help track problems down. You are encouraged to use them everywhere (avoiding  `var`, untyped arguments, untyped list literals, and so on) as this is the quickest and least painful way of tracking down problems.  
  
For more information, see  [Using the Dart analyzer](https://github.com/flutter/flutter/wiki/Using-the-Dart-analyzer).  
  
**NOTE:** `flutter analyze` command is first step of the of the CI/CD pipeline, if this step fails the build process stops and the notify the dev team about the issue, so please **make sure you run the `flutter analyze` command before you create you PR**  
  
## Methods.  
  
- Methods names should use camelCase style, eg `onLogout`  
- Following the Dart standard private methods use have the **_ prefix** , i.e `_onLogout`  
- It's preferable to use named parameters over positional parameters, i.e `onSubmit({String user, String password})`  

  
For more information, see  [Dart Parameters](https://dart.dev/guides/language/language-tour#parameters).  
  
## Folders and files.  
  
1. Lowercase on any folder .  
2. Prefer `_` over camelCase for folders and files naming, eg `coordinator_page.dart`.  
3. Screens files should have the postfix **_page** on the filename, eg `coordinator_page`  
4. ViewModel files should have the postfix **_viewmodel** on the filename, eg `coordinator_viewmodel`  

## Dart Naming Conventions
  - **UpperCamelCase** names capitalize the first letter of each word, including the first.
  - **lowerCamelCase** names capitalize the first letter of each word, except the first which is always lowercase, even if it’s an acronym.
  - **lowercase_with_underscores** names use only lowercase letters, even for acronyms, and separate words with _.
  
# 2) 📝 Pull Request.   
  
## Before reviewing  
  
- Make sure the PR code don't have `flutter analyze` issues and follow this template that will show automatically when you are creating a new PR pointing to *dev*.

```  
## 📱 Working on app implementations:
  
* [ ] Upload `Screenrecord/Screenshots` from **Android** implementation.  
* [ ] Upload `Screenrecord/Screenshots` from **iOS** implementation.   
  
## 🤓 Working on native implementations:  
  
* [ ] Elaborate the change of each specific  
  
## ✚ Adding and Updating Packages? (If applicable)  
  
* [ ] Explain an elaborate the package.  
* [ ] Add to the packages list.  
  
## 💯 Quality  
  
* [ ] No new warnings or errors using `fluter analyze`.  
* [ ] All private methods start with _ prefix.  
  
**PLEASE IGNORE ANY PR THAT DOES NOT HAVE THIS DESCRIPTION UPDATED**
 
```  
  
# 3) 🗂 Scaffolding.  
  
```  
.  
├── assets  
│  └── images  
│  │  ├── 2.0x  
│  │  ├── 3.0x  
│  └── json  
├── android  
├── ios  
├── fonts  
├── config -> **not present in version control**  
├── lib  
│  ├── classes  
│  │  ├── entities
│  │  ├── exceptions
│  │  ├── extensions
│  │  ├── helper
│  │  ├── locale
│  │  ├── shared_states
│  ├── common_widgets  
│  ├── constants  
│  ├── enums  
│  ├── flavors  
│  ├── generated (Strings Localization generated) 
│  ├── l10n (Strings Localization)  
│  ├── managers  
│  ├── models  
│  ├── repositories  
│  ├── router  
│  ├── screens
│  │  ├── coordinator
│  │  ├── gps_permission
│  │  ├── homes
│  │  ├── languages
│  │  ├── prepare_app
│  │  ├── profile
│  │  ├── rewards_detail
│  │  ├── rewards
│  │  ├── setting_pages
│  │  ├── sign_in
│  │  ├── splash_screen
│  ├── services  
└── test  
```  
  
# 4) 🎨 Code style and other preferences.  
  
1. Android Studio and VSCode compatible.  
2.  For Android Studio & VSCode please turn on the Format code on save and Organize imports on save feature  ([official documentation](https://flutter.dev/docs/development/tools/formatting#automatically-formatting-code-in-android-studio-and-intellij))  
  
    **Android Studio:**  Preferences -> Languages & Frameworks -> Flutter -> Editor -> Formant code on save & Organize imports on save  
    
    **VSCode:**  
    To automatically format the code in the current source code window, right-click in the code window and select  `Format Document`. You can add a keyboard shortcut to this VS Code Preferences.  
    To automatically format code whenever you save a file, set the  `editor.formatOnSave`  setting to  `true`.  
    
3. **Configurations:** Add configuration constants  inside `config/` such as `API urls`, `Private keys`, etc, app runs different flavors so each entry should be added to the 4 flavors files.  
4. **Strings:** No literal strings, create literal string only as constants  
- Global constants are defined inside **AmpConstants** that exist inside of the file`lib/classes/constants/constants.dart`.  
 5. **Colors:** For HEX colors use long-form (10-chars) and keep it uppercase. All colors constants are defined inside **AmpColors** class that exist in our `amp_ui` package, followed by the file `amp_ui/lib/classes/amp_colors.dart`.  `. In order to keep consistency on the UI please double check with the Design and Tech leads before adding a new value in this class.  
6. **Spacing:** General UI margins/spacing constants are defined inside **AmpSpacing** class that exist in our `amp_ui` package, followed by the file `amp_ui/lib/classes/amp_spacing.dart`.  . In order to keep consistency on the UI please double check with the Design and Tech leads before adding a new value in this class.  
7. **Sizes:** General UI size constants are defined inside **AmpSizes** class that exist in our `amp_ui` package, followed by the file `amp_ui/lib/classes/amp_sizes.dart`.  
8. **Fonts:** General font style constants are defined inside **AmpFonts** class that exist in our `amp_ui` package, followed by the file `amp_ui/lib/classes/amp_fonts.dart`.   In order to keep consistency on the UI please double check with the Design and Tech leads before adding a new value in this class.  
9. **Styles:** General widgets styles constants are defined inside **AmpStyles** class that exist in our `amp_ui` package, followed by the file `amp_ui/lib/classes/amp_styles.dart`.  
10. **Assets:** Relative paths to load images/videos/data any other asset file should be defined as a constant inside the corresponding class  that exist in our `amp_ui` package, followed by the file `amp_ui/lib/classes/amp_theme.dart`.  .  
11. **Helpers:** Split render elements into smalls atomic helpers. General helper functions should be added to the corresponding class inside the files located at `amp_ui/lib/classes/amp_theme.dart`.  
12. **Prints:** Remove any `print()` and use `log()` instead for important feedback, i.e on `catch` statements.  
13. **Navigation:** Each Page should have it's own `AutoRoute` definition. That can be find under the file `lib/router/router.dart`
  Be sure of naming your pages correctly and always run 
  `flutter pub run build_runner build --delete-conflicting-outputs` to generate new changes on the routes.

14. **Variables:**  
  * Use meaningful variable names  
      * For readability avoid using acronyms  
15. **MVVM:** This project implements the MVVM pattern for screens or any complex widget. For more information visit the following links:  
* [MVVM Architecture](https://www.wintellect.com/model-view-viewmodel-mvvm-explained/).  
* [Flutter: MVVM Architecture](https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958).
16. **State Management** We are currently working with *RiverPod*, please follow this link to find more information about how it works.
* [Riverpod Documentation](https://riverpod.dev/docs/getting_started).
* [Freezed Documentation](https://pub.dev/documentation/freezed/latest/).
  
# 5) 👩🏻‍💻 Entities Code Generation.    

Review the official documentation:

-   [Serializing JSON using code generation libraries](https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries)

NOTE: Every time a new model is created execute the following command to generate the .g.dart file

flutter pub run build_runner build --delete-conflicting-outputs

# 6) 🔁 GIT, Workflow Model.  
  
One phrase, the power of branches, as well a few other rules to keep or git log beautiful and clean.  
  
## General GIT Rules.  
  
- Keep the environment clean, delete merged branches.  
- Merge strategy for merge features branches into develop `git merge --squash`.  
  
## Main Branches.  
  
- Master: A highly stable branch, it is always production-ready.  
- Preprod: derived from the develop, used for pre-release testing.  
- Stage: derived from the develop, used for day to day testing.  
- Develop: derived from the master, used for integrating different feature branches.  
  
## Temporary Branches.  
  
- Feature: specific development.  
- Hotfix: derived from master branch, it fixes a bug in production and it's merged into master and develop.  
  
## Conventional Commits (+JIRA).  
  
- Prefer enforcing properly formatted commit messages.  
- Commit messages must meet the conventional commit format. [conventionalcommits](https://www.conventionalcommits.org/en/v1.0.0/).  
- Commit messages must include the JIRA project and JIRA Id task.  
  
```  
git commit -m "WE-1001: fix(login) - Fixed bug on foo"  
git commit -m "WE-1001: feat(profile) - Adds new form"  
git commit -m "WE-1001: chore - Updated README"  
git commit -m "WE-1001: feat(ui) - Added dark theme"  
```  
  
# 7) 🚀 Continuos integration and deployment. 
  
- WIP
  
# 8) 📔 JIRA Workflow.  
  
## Workflow columns and responsibilities.  
  
| Column | Responsibility |  
| :-------------: | :---------------------------------------: |  
|      Open |             Item to be worked |  
|   In Progress |                Active work |  
|   Code Review |          Waiting code review feedback |  
|  Ready for Testing |           Code was merge and waiting to be released |  
| In Testing |     Item is beign test by QA Team |  
|      Done |   Task Completed |  
  
## Story structure.  
  
- All stories/tasks must contain the following properties:  
- Mock: Link to the mock/ui file.  
- Description: Short description.  
- Test Suite or Acceptance Criteria: link to the test suite steps.  
  
# 9) 📱 Quality Assurance(QA), Manual & Automated.  
  
## Manual Testing.  
  
- Any feature branch requires Manual testing to be approved and then merged.  
- Regression Test must be executed over Develop branch when a milestone is reached or sprint is finished.  
- Manual testing must run over physical devices.  
- Manual testing must run over multi-platform devices iOS and Android.  
- Tests results must appeared in immutable/versioned link in the JIRA task using `Zephyr` and test cycles.
  
| Branch | Type | Testers | How |  
| :-----: | :---------: | :----------------: | :------------------------------: |  
| Master | Production |    Final users |           Distribution |  
| Preprod | Pre-release |   Stake Holders | Test-Flight Android Channels ABB&APK |  
| Stage | Development |        QA's |         Binaries APK/IPA |  
| Develop | Development | Developer and QA's |          Ad-hoc and APK |  
  
## Default Device Testing Configuration.  

- Android
- Version Android 10
- Screen size: 6.47 inches
- Resolution 2340 x 1080 
- 16:25
- iPhone 13
- Version 15.4.1
- Screen size: 6,06
- Resolution 2532 x 1170 
  
# 10) ✨ Provider State Management.  
  
State Management & Dependency Injection:** This project implements the Riverpod package for mixture of State Management and Dependency Injection. For more information visit the following links:  
  
- [Riverpod Package](https://pub.dev/packages/riverpod) 
- [Flutter State Managemente with Riverpod](https://codewithandrea.com/articles/flutter-state-management-riverpod/)
- [State Notifier](https://riverpod.dev/docs/providers/state_notifier_provider/)
  
# 11) 🏗 Architecture and Flows  

- WIP

---


# 12) 📚 Libraries.  
  
Reviewed set of libraries by category.  
  
## Storage  
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| shared_preferences|access to device preferences|https://pub.dev/packages/shared_preferences||  
| streaming_shared_preferences|access to device preferences for custom objects|https://pub.dev/packages/streaming_shared_preferences||   

## State Management
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| flutter_riverpod| state manager|https://pub.dev/packages/flutter_riverpod||  
| freezed_annotation| inmmutable states |https://pub.dev/packages/freezed_annotation||    

## UI  
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| webview_flutter| embeded webview|https://pub.dev/packages/webview_flutter||    
| just_the_tooltip| tooltip |https://pub.dev/packages/just_the_tooltip||
| mime | File type |https://pub.dev/packages/mime||
| clippy_flutter | custom shapes |https://pub.dev/packages/clippy_flutter||
| custom_info_window | custom widget based on google_maps_flutter|https://pub.dev/packages/custom_info_window||
| carousel_slider | carousel slider widget |https://pub.dev/packages/carousel_slider||
| image_picker | image picker |https://pub.dev/packages/image_picker||

## Maps
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
|google_maps_flutter | google maps |https://pub.dev/packages/google_maps_flutter||

## Navigation
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
|auto_route | routing |https://pub.dev/packages/auto_route||

## Deep Linking  
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| app_links | used to get the first address coming from a link |https://pub.dev/packages/app_links||

## Localization
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| flutter_localized_locales| translate languages|https://pub.dev/packages/flutter_localized_locales||  
| intl|strings localization|https://pub.dev/packages/intl||  
  
## Utilities  
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| connectivity| online/offline check|https://pub.dev/packages/connectivity||  
| package_info|read package info|https://pub.dev/packages/package_info||  
| device_info_plus| device info|https://pub.dev/packages/device_info_plus||  
| http | making HTTP requests |https://pub.dev/packages/http||
| geolocator | location utilities |https://pub.dev/packages/geolocator||
| permission_handler| handles device permissions |https://pub.dev/packages/permission_handler||
| uuid | generates unique id |https://pub.dev/packages/uuid||

## Dev dependencies  
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| build_runner| code generation|https://pub.dev/packages/build_runner||  
| json_serializable| json parsing|https://pub.dev/packages/json_serializable||   
| freezed| immutable state|https://pub.dev/packages/freezed||
| auto_route_generator| navigation |https://pub.dev/packages/auto_route||
| flutter_lints | clean code |https://pub.dev/packages/flutter_lints|||

## Analytics
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| flutter_new_relic_agent| New Relic |||  
| amplitude_flutter| Amplitud|https://pub.dev/packages/amplitude_flutter|| 

## Custom Packages
| Library | Usage | URL | License |  
| :---: | :-: | :-: | :-: |  
| OKTA| User authorization|https://github.com/wmg-ae/flutter_okta|| 
| flutter_new_relic_agent| app analytics and crash reporting|https://github.com/wmgdsp/flutter-newrelic-agent||  
| amp_api| DV api communication|https://github.com/wmg-ae/amp_api|| 
| amp_ui| AMP common widget|https://github.com/wmg-ae/amp_ui|| 
| amp_foundation| AMP common extensions and helpers|https://github.com/wmg-ae/amp_foundation|| 