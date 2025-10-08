import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobs/core/route_manager.dart';
import 'package:jobs/features/auth/presentation_layer/screens/create_account_screen.dart';
import 'package:jobs/features/auth/presentation_layer/screens/login_screen.dart';
import 'package:jobs/features/home/superhome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'jobs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routes: {
        RoutePage.login: (context) => LoginScreen(),
        RoutePage.createaccount: (context) => CreateAccountScreen(),
        RoutePage.superhome: (context) => SuperhomeScreen(),
      },
      initialRoute: RoutePage.login,
    );
  }
}
