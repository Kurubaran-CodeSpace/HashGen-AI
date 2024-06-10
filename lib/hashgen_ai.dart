library hashgen_ai;

import 'package:http/http.dart' as http;
import 'dart:convert';

/// A class that provides functionality to generate hashtags using OpenAI.
class HashGenAI {
  /// The API key used to authenticate with the OpenAI API.
  final String apiKey;

  /// An optional HTTP client for making requests. Defaults to [http.Client] if not provided.
  http.Client client;

  /// Creates an instance of [HashGenAI].
  ///
  /// The [apiKey] parameter is required to authenticate with the OpenAI API.
  /// An optional [client] can be provided, which defaults to [http.Client] if not specified.
  HashGenAI(this.apiKey, {http.Client? client}) : client = client ?? http.Client();

  /// Generates a list of hashtags based on the provided [content].
  ///
  /// The [numberOfHashtags] parameter specifies how many hashtags to generate.
  /// Returns a list of generated hashtags.
  ///
  /// Throws an [Exception] if the request fails.
  Future<List<String>> generateHashtags(String content, int numberOfHashtags) async {
    // Construct the API request
    final response = await client.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content': 'You are a helpful assistant that generates hashtags.'
          },
          {
            'role': 'user',
            'content': 'Generate $numberOfHashtags hashtags for the following content: $content'
          },
        ],
        'max_tokens': 60,
      }),
    );

    // Check if the response status is OK (200)
    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String text = data['choices'][0]['message']['content'];

      // Split the text into individual hashtags and return as a list
      return text.split('\n').where((hashtag) => hashtag.isNotEmpty).toList();
    } else {
      // Throw an exception if the request fails
      throw Exception('Failed to generate hashtags');
    }
  }
}