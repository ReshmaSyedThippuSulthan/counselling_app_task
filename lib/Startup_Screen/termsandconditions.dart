import 'package:counselling_task/Utils/colors.dart';
// import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/material.dart';

class TermsAndService extends StatefulWidget {
  const TermsAndService({super.key});

  @override
  State<TermsAndService> createState() => _TermsAndServiceState();
}

class _TermsAndServiceState extends State<TermsAndService> {
  final String htmlcontent = """
    <h1>Hello </h1>
    <h2 style='color:red'>World</h2>
    <p>This is sample paragraph</p>
    <p> H<sup>2</sup>O </p>
    <p> A<sub>2</sub> </p>
    <i>italic</i> <b>bold</b> <u>underline</u> <s>strike </s>
    <ul>
      <li>Item 1</li>
      <li>Item 2</li>
      <li>Item 3</li>
    </ul>
    <br><br>
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
  """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(width: 0.5, color: Colors.white))),
                    onPressed: () {},
                    icon: const Icon(Icons.close_rounded),
                    color: Colors.white,
                    iconSize: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Image.asset("assets/images/terms&condition.png"),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Terms of Service",
                        style: TextStyle(
                            color: Colour.secondaryTextColor, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Update 16/03/2023",
                        style: TextStyle(color: Colors.white24, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Container(child: Html(data: htmlcontent))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
