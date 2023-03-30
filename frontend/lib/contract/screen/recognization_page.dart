import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../const/color.dart';
import '../Utils/google_cloud_translation.dart';
import '../Utils/translation_model.dart';

String getContractLanguage = "ko";

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
      apiKey: "AIzaSyB9HaebLTFdtIpBfEv_h127wKvd5ycstrE",
    );

    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: const Text(""),
          foregroundColor: PRIMARY_COLOR,
          backgroundColor: BODY_TEXT_COLOR,
        ),
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
                    width: MediaQuery.of(context).size.width,
                    child : SingleChildScrollView(
                      child : Column (
                        children: <Widget>[
                          const SizedBox(height: 30),
                          Text(controller.text),
                          const SizedBox(height: 30),
                          Container(
                            color: const Color(0x82043F99),
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            child: Text(_translated.translatedText, style: const TextStyle(color: Colors.white))
                          ),
                          Container(
                            color: const Color(0x82043F99),
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(top: 10, bottom: 150,left: 20,right: 20),
                            child: Text('Detected language - ${_translated.detectedSourceLanguage}', style: const TextStyle(color: Colors.black)),
                          ),
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
          _translated = await _translation.translate(text: controller.text, to: getContractLanguage);
          _detected = await _translation.detectLang(text: controller.text);
          setState(() {});
        },
        tooltip: 'Translate',
        child: const Icon(Icons.language),
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
