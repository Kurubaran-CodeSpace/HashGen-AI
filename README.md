
# hashgen_ai

`hashgen_ai` is a Flutter package that utilizes OpenAI's API to generate relevant hashtags based on the provided content and the desired number of hashtags. This package supports Android, iOS, web, and macOS platforms.

## Features

- Generate hashtags based on the content provided
- Specify the number of hashtags to generate
- Easy integration with OpenAI API
- Supports multiple platforms: Android, iOS, web, and macOS

## Getting started

### Prerequisites

1. **Flutter SDK**: Ensure you have Flutter installed. You can download it from [flutter.dev](https://flutter.dev/docs/get-started/install).
2. **OpenAI API Key**: Sign up for an API key from [OpenAI](https://beta.openai.com/signup/).

### Installation

Add `hashgen_ai` to your `pubspec.yaml`:

```yaml
dependencies:
  hashgen_ai: ^1.0.1
```

Then, run `flutter pub get` to install the package.

## Usage

### Basic Example

```dart
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
```

Replace `'YOUR_OPENAI_API_KEY'` with your actual OpenAI API key.

## Additional information

For more information on how to use the `hashgen_ai` package, visit the [documentation](https://pub.dev/documentation/hashgen_ai/latest/).

### Contributing

We welcome contributions to the `hashgen_ai` package. Before you start, please check the [CONTRIBUTING.md](https://github.com/Kurubaran-CodeSpace/HashGen-AI/CONTRIBUTING.md) for guidelines on how to contribute and the [issues.md](https://github.com/Kurubaran-CodeSpace/HashGen-AI/issues.md) for known issues and how to report new ones. If you have an idea for a new feature or have found a bug, please open an issue on our [GitHub repository](https://github.com/Kurubaran-CodeSpace/HashGen-AI).

### Issues

If you encounter any problems or have questions about `hashgen_ai`, please feel free to open an issue on our [GitHub repository](https://github.com/Kurubaran-CodeSpace/HashGen-AI/issues).

### Authors

- Kurubaran Anandhan
- Hemalatha Gurunathan

### License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Kurubaran-CodeSpace/HashGen-AI/blob/main/LICENSE) file for details.
