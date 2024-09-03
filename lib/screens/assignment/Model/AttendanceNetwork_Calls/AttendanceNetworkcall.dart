import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as h;

class AttendanceNetworkCall {
  static Future<Map<String, dynamic>> sendAttendanceData(
    String token,
    Map<String, String> body,
  ) async {
    const String _baseUrl =
        'https://dev5.thestaffer.com/api/admin/employee/employee-attendance';

    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };

    final response = await h.post(
      Uri.parse(_baseUrl),
      headers: _headers,
      body: body,
    );

    log('Request Body: $body');
    log('Response Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final parsedResponse = json.decode(response.body);
      return parsedResponse;
    } else {
      throw Exception('Failed to send data: ${response.reasonPhrase}');
    }
  }
}
