import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchPublicIP() async {
  try {
    final response =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));
    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = json.decode(response.body);

      // Extract and return the IP address value
      return data['ip'];
    } else {
      throw Exception('Failed to load IP address');
    }
  } catch (e) {
    throw Exception('Failed to connect to the API: $e');
  }
}

void main() {
  fetchPublicIP().then((ip) {
    print('Your public IP address is: $ip');
  }).catchError((error) {
    print('Error: $error');
  });
}
