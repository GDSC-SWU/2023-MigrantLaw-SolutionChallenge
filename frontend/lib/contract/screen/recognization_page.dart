import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../Utils/google_cloud_translation.dart';
import '../Utils/translation_model.dart';

class RecognizePage extends StatefulWidget {
  final String? path;
  const RecognizePage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  bool _isBusy = false;

  TextEditingController controller = TextEditingController();

  late Translation _translation;
  final String _text =
      'Toda persona tiene derecho a la educación. La educación debe ser gratuita, al menos en lo concerniente a la instrucción elemental y fundamental. La instrucción elemental será obligatoria. La instrucción técnica y profesional habrá de ser generalizada; el acceso a los estudios superiores será igual para todos, en función de los méritos respectivos.';
  TranslationModel _translated = TranslationModel(translatedText: '', detectedSourceLanguage: '');
  TranslationModel _detected = TranslationModel(translatedText: '', detectedSourceLanguage: '');


  @override
  void initState() {

    _translation = Translation(
      apiKey: 'AIzaSyDyPVticF6oPvvlMV3nZdvjID7zysXpttc',
    );

    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("")),
        body: _isBusy == true
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child : SingleChildScrollView(
                      child : Column (
                        children: <Widget>[
                          Text(
                            'Initial text',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(controller.text),
                          SizedBox(height: 30),
                          Text('Translated text', style: Theme.of(context).textTheme.headline3),
                          Text(_translated.translatedText, style: TextStyle(color: Colors.blueAccent)),
                          Text('Detected language - ${_translated.detectedSourceLanguage}', style: TextStyle(color: Colors.red)),
                          const SizedBox(height: 20),
                          Text('Language detected with detectLang, without translation - ${_detected.detectedSourceLanguage}',
                              style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    )
                )
            )
          ],
        ),
      // ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _translated = await _translation.translate(text: controller.text, to: 'en');
          _detected = await _translation.detectLang(text: controller.text);
          setState(() {});
        },
        tooltip: 'Translate',
        child: Icon(Icons.language),
      ),
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);

    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
    await textRecognizer.processImage(image);

    controller.text = recognizedText.text;

    ///End busy state
    setState(() {
      _isBusy = false;
    });
  }
}
