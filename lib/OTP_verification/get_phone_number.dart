import 'package:counselling_task/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GetPhoneNumber extends StatefulWidget {
  const GetPhoneNumber({super.key});

  @override
  State<GetPhoneNumber> createState() => _GetCountryState();
}

class _GetCountryState extends State<GetPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.backgroundColor,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Colour.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text("Enter phone number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please enter your 10 digit mobile \n number to receive OTP",
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.clip,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.orange, fontSize: 14),
              ),
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: 100,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white38, width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/img 1.png"),
                        fit: BoxFit.fill,
                        height: 30,
                        width: 50,
                      ),
                      const SizedBox(width: 20),
                      const Text("+91",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            autofocus: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              fillColor: Color.fromARGB(255, 248, 155, 155),
                              //  filled: true,
                              hintText: "9987771100",
                              hintStyle: TextStyle(
                                  color: Colors.white24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      backgroundColor: const Color(0xFF212426)),
                  child: const Text(
                    "Get OTP",
                    style: TextStyle(color: Color(0xFFF9D3B4), fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
