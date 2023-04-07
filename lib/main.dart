import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_wise/Screens/forgot_profile.dart';
import 'package:share_wise/Screens/login.dart';
import 'package:share_wise/Screens/privacy_and_policy.dart';
import 'package:share_wise/Screens/register_new_user.dart';
import 'package:share_wise/Screens/s_o_s.dart';
import 'package:share_wise/Screens/shopping_cart.dart';
import 'package:share_wise/Screens/to_do.dart';
import 'package:share_wise/Screens/user_documents.dart';
import 'package:share_wise/Screens/user_family.dart';
import 'package:share_wise/Screens/user_health.dart';
import 'package:share_wise/Screens/user_license.dart';
import 'package:share_wise/Screens/user_wallet.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Screens/app_settings.dart';
import 'Screens/dashboard.dart';
import 'Utilities/constants.dart';
import 'Utilities/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dirPath = await path.getApplicationDocumentsDirectory();
  // Hive.init(dirPath.path);
  // Hive.initFlutter('hiveDB');
  // Hive.registerAdapter(UserAdapter());
  // Hive.registerAdapter(FavoritesAdapter());
  // var shoppingCart = await Hive.openBox(Constants.shoppingCart);
  // var toDo = await Hive.openBox(Constants.toDo);
  // var userLicense = await Hive.openBox(Constants.userLicense);
  // var userWallet = await Hive.openBox(Constants.userWallet);
  // var userDocument = await Hive.openBox(Constants.userDocument);
  // var userFamily = await Hive.openBox(Constants.userFamily);
  // var userHealth = await Hive.openBox(Constants.userHealth);

  // var userProfile = await Hive.openBox(Constants.userProfile);

  // final SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    // defaultTransition: Transition.native,
    themeMode: (SpUtils.getString(Constants.appThemeMode) == null)
        ? ThemeMode.dark
        : ThemeMode.dark,
    theme: ThemeData(
        primaryColor: Colors.indigo,
        primaryColorDark: Colors.indigo,
        primarySwatch: Colors.indigo),
    getPages: [
      GetPage(
          name: '/',
          transition: Transition.cupertino,
          page: () => const Login()),
      GetPage(
          name: '/${Constants.login}',
          transition: Transition.cupertino,
          page: () => const Login()),
      GetPage(
          name: '/${Constants.dashboard}',
          transition: Transition.cupertino,
          page: () => const DashBoard()),
      GetPage(
          name: '/${Constants.toDo}',
          transition: Transition.cupertino,
          page: () => const ToDo()),
      GetPage(
          name: '/${Constants.shoppingCart}',
          transition: Transition.cupertino,
          page: () => const ShoppingCart()),
      GetPage(
          name: '/${Constants.userLicense}',
          transition: Transition.cupertino,
          page: () => const UserLicense()),
      GetPage(
          name: '/${Constants.userWallet}',
          transition: Transition.cupertino,
          page: () => const UserWallet()),
      GetPage(
          name: '/${Constants.userFamily}',
          transition: Transition.cupertino,
          page: () => const UserFamily()),
      GetPage(
          name: '/${Constants.userHealth}',
          transition: Transition.cupertino,
          page: () => const UserHealth()),
      GetPage(
          name: '/${Constants.userDocuments}',
          transition: Transition.cupertino,
          page: () => const UserDocuments()),
      GetPage(
          name: '/${Constants.SOS}',
          transition: Transition.cupertino,
          page: () => const SoS()),
      GetPage(
          name: '/${Constants.registerUser}',
          transition: Transition.cupertino,
          page: () => const RegisterUser()),
      GetPage(
          name: '/${Constants.privacyPolicy}',
          transition: Transition.cupertino,
          page: () => const PrivacyAndPolicy()),
      GetPage(
          name: '/${Constants.appSettings}',
          transition: Transition.cupertino,
          page: () => const AppSettings()),
      GetPage(
          name: '/${Constants.forgotCredentials}',
          transition: Transition.cupertino,
          page: () => const ForgotCredentials()),
    ],
  ));
}
