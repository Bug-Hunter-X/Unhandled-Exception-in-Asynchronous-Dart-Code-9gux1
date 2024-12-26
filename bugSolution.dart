```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // Process jsonData
        print('Data fetched successfully: $jsonData');
      } catch (e) {
        print('Error parsing JSON: $e');
        // Handle JSON parsing error, retry, or show alternative UI
      }
    } else {
      // Retry the request a few times before giving up
      int retryCount = 3;
      while (response.statusCode != 200 && retryCount > 0) {
        print('Retrying request...');
        await Future.delayed(const Duration(seconds: 2)); // Wait before retrying
        response = await http.get(Uri.parse('https://api.example.com/data'));
        retryCount--;
      }
      if (response.statusCode != 200) {
        // Show an error message to the user
        print('Failed to load data after multiple retries. Status code: ${response.statusCode}');
      }
    }
  } catch (e) {
    // Handle network or other errors
    print('Error fetching data: $e');
    // Show a user-friendly error message, for instance
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error fetching data')));
  }
}
```