import 'package:challenge_pragma_msolimano/injection.dart';
import 'package:challenge_pragma_msolimano/src/bloc_providers.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/home_page.dart';
import 'package:challenge_pragma_msolimano/src/presentation/shared/constants.dart';
import 'package:challenge_pragma_msolimano/src/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        title: 'Pragma Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: baseColor),
          useMaterial3: true,
        ),
        initialRoute: HomePage.routeName,
        home: const SplashPage(),
      ),
    );
  }
}
