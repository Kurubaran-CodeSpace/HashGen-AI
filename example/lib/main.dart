import 'package:flutter/material.dart';
import 'package:hashgen_ai/hashgen_ai.dart';

void main() {
  runApp(MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HashGenAIExample(),
    );
  }
}

/// A stateful widget demonstrating the usage of HashGen AI.
class HashGenAIExample extends StatefulWidget {
  @override
  _HashGenAIExampleState createState() => _HashGenAIExampleState();
}

class _HashGenAIExampleState extends State<HashGenAIExample> {
  // Instance of HashGenAI initialized with the API key
  final HashGenAI hashGenAI = HashGenAI('YOUR_OPENAI_API_KEY');

  // List to store generated hashtags
  List<String> hashtags = [];

  /// Method to generate hashtags using HashGenAI
  void _generateHashtags() async {
    // Generate hashtags based on provided content
    final generatedHashtags = await hashGenAI.generateHashtags(
      'Flutter is an open-source UI software development toolkit created by Google.',
      5,
    );
    // Update the state with the generated hashtags
    setState(() {
      hashtags = generatedHashtags;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HashGen AI Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _generateHashtags,
              child: Text('Generate Hashtags'),
            ),
            SizedBox(height: 16.0),
            // Display the generated hashtags
            ...hashtags.map((hashtag) => Text(hashtag)).toList(),
          ],
        ),
      ),
    );
  }
}