import 'package:counselling_task/OTP_verification/get_otp.dart';
import 'package:counselling_task/Utils/colors.dart';
import 'package:counselling_task/api_collection/api.dart';
import 'package:counselling_task/provider/counselling_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class GetPhoneNumber extends StatefulWidget {
  final String flag;
  final String code;

  static const String routeName = "/get_Phone_Number";
  const GetPhoneNumber({super.key, required this.flag, required this.code});

  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
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
                      SvgPicture.network(
                        widget.flag,
                        width: 50,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      Text(widget.code,
                          style: const TextStyle(
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
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
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
                  onPressed: () {
                    // if (phoneController.text.isNotEmpty) {
                    //   print(
                    //       "role${Provider.of<CounsellingProvider>(context, listen: false).TypeRole == Role.student}");
                    //   if (Provider.of<CounsellingProvider>(context,
                    //               listen: false)
                    //           .TypeRole ==
                    //       Role.student) {
                    //     ApiCall.studentLogin(widget.code, phoneController.text)
                    //         .then((value) {
                    //       print("statuscode${value.statusCode}");
                    //       if (value.success!) {
                    Navigator.of(context).pushNamed(GetVerifyNumber.routeName);
                    //       }
                    //     });
                    //   }
                    // }
                  },
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
