import 'package:counselling_task/Country_Selection/selection_country.dart';
import 'package:counselling_task/Utils/colors.dart';
import 'package:counselling_task/api_collection/api.dart';
import 'package:counselling_task/provider/counselling_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GetVerifyNumber extends StatefulWidget {
  static const String routeName = "/getotp";
  const GetVerifyNumber({super.key});

  @override
  State<GetVerifyNumber> createState() => _GetCountryState();
}

class _GetCountryState extends State<GetVerifyNumber> {
  TextEditingController phoneController = TextEditingController();
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
              const Text("Verify Number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please enter the OTP recevied to \n verify your number",
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.clip,
                textDirection: TextDirection.ltr,
                style:
                    TextStyle(color: Colour.secondaryTextColor, fontSize: 14),
              ),
              const SizedBox(
                height: 100,
              ),
              OTPTextField(
                otpFieldStyle:
                    OtpFieldStyle(enabledBorderColor: const Color(0xFF7D7E80)),
                length: 6,
                width: MediaQuery.of(context).size.width * 0.7,
                fieldWidth: 40,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: $pin");
                },
              ),
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Didn't recevied OTP?",
                style: TextStyle(fontSize: 14, color: Color(0xFF7D7E80)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<CounsellingProvider>(context, listen: false)
                            .TypeRole ==
                        Role.student;
                    ApiCall.resendOtp(phoneController.text).then((value) {
                      if (value.success!) {
                        Fluttertoast.showToast(
                            msg: value.message!,
                            fontSize: 20,
                            backgroundColor: Colour.backgroundColor,
                            textColor: Colors.white);
                      }
                    });
                  },
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(
                        color: Colour.secondaryTextColor, fontSize: 18),
                  )),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SelectCountry.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      backgroundColor: const Color(0xFF212426)),
                  child: const Text(
                    "Verify",
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
