import 'package:counselling_task/Utils/colors.dart';
import 'package:flutter/material.dart';

class GetCountry extends StatefulWidget {
  const GetCountry({super.key});

  @override
  State<GetCountry> createState() => _GetCountryState();
}

class _GetCountryState extends State<GetCountry> {
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
              const Text("Select your Country",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.normal)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.orange,
                      ),
                      prefixIconColor: Colors.grey[300],
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
