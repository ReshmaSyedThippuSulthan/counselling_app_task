class ApiResponse {
  ApiResponse(
      {this.data, this.success, this.message, required this.statusCode});
  dynamic data;
  bool? success;
  String? message;
  int statusCode;
}
