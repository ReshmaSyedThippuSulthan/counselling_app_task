import 'package:counselling_task/OTP_verification/get_country.dart';
import 'package:counselling_task/provider/counselling_provider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class StartupScreen extends StatefulWidget {
  static const String routeName = "/startupScreen";
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Image.asset("assets/images/startup_bg.png").color,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.loose,
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/startup_bg.png"),
                        fit: BoxFit.fill)),
                child: const Column(children: []),
              ),
              Container(
                height: 310,
                width: 600,
                decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Welcome to Study Lancer",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Please select your role to get registered",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    const SizedBox(height: 5),
                    Consumer<CounsellingProvider>(
                      builder: (context, value, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black45, width: 5),
                                      //color: Colors.black,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/student.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              onTap: () {
                                value.setRole(Role.student);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const GetCountryScreen(),
                                ));
                              },
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 150,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black45, width: 5),
                                        //    color: Colors.black,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Agent.png"),
                                            fit: BoxFit.fill))),
                              ),
                              onTap: () {
                                value.setRole(Role.agent);
                                Navigator.of(context)
                                    .pushNamed(GetCountryScreen.routeName);
                              },
                            ),
                          ]),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "By Continuing you agree to our",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Terms and Conditions",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 12),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
