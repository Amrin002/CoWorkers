import 'package:coworker_mobile/config/app_color.dart';
import 'package:coworker_mobile/config/appwrite.dart';
import 'package:coworker_mobile/config/enums.dart';
import 'package:coworker_mobile/config/session.dart';
import 'package:coworker_mobile/pages/dashboard.dart';
import 'package:coworker_mobile/pages/get_started_page.dart';
import 'package:coworker_mobile/pages/sign_in_page.dart';
import 'package:coworker_mobile/pages/sign_up_page.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Appwrite.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: AppColor.text,
            displayColor: AppColor.text,
          ),
          primaryColor: AppColor.primary,
          colorScheme: const ColorScheme.light(primary: AppColor.primary),
          filledButtonTheme: const FilledButtonThemeData(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size.fromHeight(52)),
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))),
      initialRoute: AppRoute.dashboard.name,
      routes: {
        AppRoute.getStarted.name: (context) => const GetStartedPage(),
        AppRoute.signUp.name: (context) => const SignUpPage(),
        AppRoute.signIn.name: (context) => const SigninPage(),
        AppRoute.dashboard.name: (context) {
          return FutureBuilder(
            future: AppSession.getUser(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return DView.loadingCircle();
              }
              if(snapshot.data==null){
                return const GetStartedPage();
              }
              return const Dashboard();
            },
          );
        },
      },
    );
  }
}
