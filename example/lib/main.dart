import 'package:flutter/material.dart';
import 'package:hashgen_ai/hashgen_ai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HashGenAIExample(),
    );
  }
}

class HashGenAIExample extends StatefulWidget {
  @override
  _HashGenAIExampleState createState() => _HashGenAIExampleState();
}

class _HashGenAIExampleState extends State<HashGenAIExample> {
  final HashGenAI hashGenAI = HashGenAI('YOUR_OPENAI_API_KEY');
  List<String> hashtags = [];

  void _generateHashtags() async {
    final generatedHashtags = await hashGenAI.generateHashtags(
      'Flutter is an open-source UI software development toolkit created by Google.',
      5,
    );
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
            ...hashtags.map((hashtag) => Text(hashtag)).toList(),
          ],
        ),
      ),
    );
  }
}
