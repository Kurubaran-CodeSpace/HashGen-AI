import 'package:flutter_test/flutter_test.dart';
import 'package:hashgen_ai/hashgen_ai.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void main() {
  group('HashGenAI Tests', () {
    test('Generate Hashtags Test', () async {
      final mockClient = MockClient((request) async {
        final mapJson = {
          'choices': [
            {
              'text': '#flutter\n#dart\n#programming\n#opensource\n#developer\n',
            }
          ]
        };
        return http.Response(json.encode(mapJson), 200);
      });

      final hashGenAI = HashGenAI('YOUR_OPENAI_API_KEY', client: mockClient);
      final hashtags = await hashGenAI.generateHashtags('Flutter is great', 5);

      expect(hashtags.length, 5);
      expect(hashtags, containsAll(['#flutter', '#dart', '#programming', '#opensource', '#developer']));
    });
  });
}
