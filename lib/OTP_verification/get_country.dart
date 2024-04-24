import 'package:counselling_task/OTP_verification/get_phone_number.dart';
import 'package:counselling_task/Utils/colors.dart';
import 'package:counselling_task/api_collection/api.dart';
import 'package:counselling_task/models/country_list/datum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:counselling_task/models/country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetCountryScreen extends StatefulWidget {
  static const String routeName = "/getcountry";
  const GetCountryScreen({super.key});

  @override
  State<GetCountryScreen> createState() => _GetCountryScreenState();
}

class _GetCountryScreenState extends State<GetCountryScreen> {
  TextEditingController searchController = TextEditingController();
  List filtered = [];
  CountryList? datas;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    ApiCall.getCountryList().then((value) {
      print(value.statusCode);
      if (value.success!) {
        setState(() {
          datas = value.data as CountryList?;
          loading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
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
      body: Center(
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
                controller: searchController,
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
                onChanged: (value) {
                  filtered = [];
                  if (datas != null) {
                    setState(() {
                      filtered = (datas!.data ?? [])
                          .where((element) => element.name!
                              .toLowerCase()
                              .startsWith(value.toLowerCase()))
                          .toList();
                    });
                    print(filtered.length);
                  }
                },
              ),
            ),
            Expanded(
              child: loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : datas!.data == null
                      ? const Text("No Data",
                          style: TextStyle(fontSize: 18, color: Colors.white))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: searchController.text.isNotEmpty
                                ? filtered.length
                                : datas!.data!.length,
                            itemBuilder: (context, index) {
                              final Datum data =
                                  searchController.text.isNotEmpty
                                      ? filtered[index]
                                      : datas!.data![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => GetPhoneNumber(
                                        flag: data.flag!,
                                        code: data.telCode!,
                                      ),
                                    ));
                                  },
                                  leading: SvgPicture.network(
                                    data.flag!,
                                    width: 50,
                                    height: 25,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    data.name!,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  trailing: Text(
                                    data.telCode!,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
