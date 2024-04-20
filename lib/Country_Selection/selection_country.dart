import 'package:counselling_task/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _GetCountryState();
}

class _GetCountryState extends State<SelectCountry> {
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
              const Text("Select Country",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.normal)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please select the Country where \n you want to study",
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

              ///country selection
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
                    "Proceed",
                    style: TextStyle(color: Color(0xFFF9D3B4), fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Can't see the Country  of your interest?",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 25),

              const Text(
                "Consult with us",
                style: TextStyle(
                    color: Colour.secondaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
