import 'package:counselling_task/Country_Selection/selection_country.dart';
import 'package:counselling_task/Country_Selection/selection_country1.dart';
import 'package:counselling_task/OTP_verification/get_country.dart';
import 'package:counselling_task/OTP_verification/get_otp.dart';
import 'package:counselling_task/OTP_verification/get_phone_number.dart';
import 'package:counselling_task/Startup_Screen/startup_Screen.dart';
import 'package:counselling_task/provider/counselling_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const StudyLancer());
}

class StudyLancer extends StatelessWidget {
  const StudyLancer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<CounsellingProvider>(
          create: (context) => CounsellingProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const StartupScreen(),
        routes: {
          StartupScreen.routeName: (context) => const StartupScreen(),
          GetCountryScreen.routeName: (context) => const GetCountryScreen(),
          // GetPhoneNumber.routeName: (context) => const GetPhoneNumber(),
          GetVerifyNumber.routeName: (context) => const GetVerifyNumber(),
          SelectCountry.routeName: (context) => const SelectCountry(),
          WelcomeScreen.routeName: (context) => const WelcomeScreen()
        },
      ),
    );
  }
}
