import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextToSpeechExample(),
    );
  }
}

class TextToSpeechExample extends StatefulWidget {
  @override
  _TextToSpeechExampleState createState() => _TextToSpeechExampleState();
}

class _TextToSpeechExampleState extends State<TextToSpeechExample> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();

  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await flutterTts.setLanguage("ar-EG");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }

  Future<void> _stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Text to Speech'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter text to speak',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _speak(textController.text),
                  child: Text('Speak'),
                ),
                ElevatedButton(
                  onPressed: _stop,
                  child: Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    flutterTts.stop();
    super.dispose();
  }
}

