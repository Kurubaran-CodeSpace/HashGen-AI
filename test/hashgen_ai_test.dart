import 'package:flutter_test/flutter_test.dart';
import 'package:hashgen_ai/hashgen_ai.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void main() {
  group('HashGenAI Tests', () {
    // Test case for generating hashtags using the HashGenAI class
    test('Generate Hashtags Test', () async {
      // Mock HTTP client to simulate the OpenAI API response
      final mockClient = MockClient((request) async {
        // Simulated JSON response from OpenAI API
        final mapJson = {
          'choices': [
            {
              'text': '#flutter\n#dart\n#programming\n#opensource\n#developer\n',
            }
          ]
        };
        // Return the mock response with a status code of 200 (OK)
        return http.Response(json.encode(mapJson), 200);
      });

      // Initialize the HashGenAI instance with the mock client
      final hashGenAI = HashGenAI('YOUR_OPENAI_API_KEY', client: mockClient);

      // Call the generateHashtags method with test content and the number of hashtags
      final hashtags = await hashGenAI.generateHashtags('Flutter is great', 5);

      // Verify that the number of generated hashtags is correct
      expect(hashtags.length, 5);

      // Verify that the generated hashtags contain the expected values
      expect(hashtags, containsAll(['#flutter', '#dart', '#programming', '#opensource', '#developer']));
    });
  });
}