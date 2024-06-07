import 'package:flutter_test/flutter_test.dart';
import 'package:hashgen_ai/hashgen_ai.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Mock class for http.Client
class MockClient extends Mock implements http.Client {}

void main() {
  group('HashGenAI', () {
    final mockClient = MockClient();
    final hashGenAI = HashGenAI('fake_api_key')..client = mockClient;

    test('generates hashtags successfully', () async {
      // Arrange
      when(mockClient.post(
        any as Uri,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
        jsonEncode({
          'choices': [
            {'text': '#Flutter\n#Google\n#OpenSource\n#UI\n#Development\n'}
          ]
        }),
        200,
      ));

      // Act
      final hashtags = await hashGenAI.generateHashtags('Flutter development', 5);

      // Assert
      expect(hashtags, ['#Flutter', '#Google', '#OpenSource', '#UI', '#Development']);
    });

    test('throws an exception when the response is not 200', () async {
      // Arrange
      when(mockClient.post(
        any as Uri,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Error', 400));

      // Act & Assert
      expect(
            () async => await hashGenAI.generateHashtags('Flutter development', 5),
        throwsException,
      );
    });
  });
}
