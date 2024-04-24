import 'dart:convert';

import 'package:counselling_task/models/api_response.dart';
import 'package:counselling_task/models/counsellor_login/counsellor_login.dart';
import 'package:counselling_task/models/country_list/country_list.dart';
import 'package:counselling_task/models/resend_otp/resend_otp.dart';
import 'package:counselling_task/models/select_country/select_country.dart';
import 'package:counselling_task/models/terms_of_service/terms_of_service.dart';
import 'package:counselling_task/models/verify_otp/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/student_login/student_login.dart';

class ApiCall {
  static const String baseurl = "https://studylancer.yuktidea.com";
//terms and condition
  static Future<ApiResponse> getTerms() async {
    final response = await http.get(Uri.parse("$baseurl/api/terms-conditions"),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      TermsOfService data = TermsOfService.fromJson(response.body);
      return ApiResponse(
          data: data, success: true, statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //country list
  static Future<ApiResponse> getCountryList() async {
    final response = await http.get(Uri.parse("$baseurl/api/countries"),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      CountryList data = CountryList.fromJson(response.body);
      return ApiResponse(
          data: data, success: true, statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //select country
  static Future getSelectCountry(String token) async {
    final response = await http.get(Uri.parse("$baseurl/api/select/country"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      SelectCountry data = SelectCountry.fromJson(response.body);
      return ApiResponse(
          data: data, success: true, statusCode: response.statusCode);
    } else if (response.statusCode == 403) {
      SelectCountry data = SelectCountry.fromJson(response.body);
      return ApiResponse(
          data: data, success: false, statusCode: response.statusCode);
    } else if (response.statusCode == 401) {
      final data = json.decode(response.body);
      return ApiResponse(
          success: false,
          message: data["message"],
          statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //student login
  static Future<ApiResponse> studentLogin(String telcode, String phone) async {
    final response =
        await http.post(Uri.parse("$baseurl/api/student/login"), headers: {
      "Accept": "application/json",
    }, body: {
      "tel-code": telcode,
      "phone": phone
    });
    if (response.statusCode == 200) {
      StudentLogin data = StudentLogin.fromJson(response.body);
      return ApiResponse(
          data: data, success: true, statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //counsellor login
  static Future counsellorLogin(String telcode, String phone) async {
    final response =
        await http.post(Uri.parse("$baseurl/api/counsellor/login"), headers: {
      "Accept": "application/json",
    }, body: {
      "tel-code": telcode,
      "phone": phone
    });
    if (response.statusCode == 200) {
      CounsellorLogin data = CounsellorLogin.fromJson(response.body);
      return ApiResponse(
          data: data, success: true, statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //verify OTP
  static Future<ApiResponse> verifyOtp(String code, String phone) async {
    final response =
        await http.post(Uri.parse("$baseurl/api/counsellor/login"), headers: {
      "Accept": "application/json",
    }, body: {
      "code": code,
      "phone": phone
    });
    if (response.statusCode == 200) {
      VerifyOtp data = VerifyOtp.fromJson(response.body);
      return ApiResponse(
          data: data, success: true, statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //Resend Otp
  static Future<ApiResponse> resendOtp(String phone) async {
    final response =
        await http.post(Uri.parse("$baseurl/api/resend-otp"), headers: {
      "Accept": "application/json",
    }, body: {
      "phone": phone
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ApiResponse(
          message: data["message"],
          statusCode: response.statusCode,
          data: data,
          success: true);
    } else if (response.statusCode == 403) {
      final data = json.decode(response.body);
      return ApiResponse(
          success: false,
          message: data["message"],
          statusCode: response.statusCode);
    } else {
      return ApiResponse(statusCode: response.statusCode, success: false);
    }
  }

  //post select country
  static Future selectCountry(String token, String countryId) async {
    final response = await http.post(Uri.parse("$baseurl/api/select/country"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: {
          "country_id": countryId
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ApiResponse(
          success: true,
          message: data["message"],
          statusCode: response.statusCode);
    } else if (response.statusCode == 403 && response.statusCode == 401) {
      final data = json.decode(response.body);
      return ApiResponse(
          success: false,
          message: data["message"],
          statusCode: response.statusCode);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //logout
  static Future logout(String token) async {
    final response = await http.post(Uri.parse("$baseurl/api/logout"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ApiResponse(
          statusCode: response.statusCode,
          message: data["message"],
          success: true);
    } else if (response.statusCode == 401) {
      final data = json.decode(response.body);
      return ApiResponse(
          statusCode: response.statusCode,
          message: data["message"],
          success: false);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }

  //delete
  static Future delete(String token) async {
    final response = await http.post(Uri.parse("$baseurl/api/delete"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ApiResponse(
          statusCode: response.statusCode,
          message: data["message"],
          success: true);
    } else if (response.statusCode == 401) {
      final data = json.decode(response.body);
      return ApiResponse(
          statusCode: response.statusCode,
          message: data["message"],
          success: false);
    } else {
      return ApiResponse(success: false, statusCode: response.statusCode);
    }
  }
}
