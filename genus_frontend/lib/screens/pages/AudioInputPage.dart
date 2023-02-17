import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:genus_frontend/dataprovider/dataprovider.dart';
import 'package:genus_frontend/models/music.dart';
import 'package:http/http.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
// import 'package:flutter_audio_features/flutter_audio_features.dart';

class AudioInputPage extends StatefulWidget {
  @override
  _AudioInputPageState createState() => _AudioInputPageState();
}

class _AudioInputPageState extends State<AudioInputPage> {
  File? _audioFile;
  String? name;
  String? predicted;
  // final musicProvider = MusicDataprovider();

  void _pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      String? filePath = result.files.first.path;
      if (filePath != null) {
        setState(() {
          _audioFile = File(filePath);
          name = filePath.split('/').last;
          // OpenFile.open(_audioFile.path);
        });
      }
    }
  }

  String apiUrl = "http://192.168.43.250:8000";

  void trial() async {
    String url = "$apiUrl/genus/trial/";
    var postUri = Uri.parse(url);
    var request = http.Request('GET', postUri);
    var response = await request.send();
    print(";;;;;");
    print(response.statusCode);
  }

  void predict(File? _audioFile) async {
    String? fileName = _audioFile?.path.split('/').last;
    String url = "$apiUrl/genus/add/";
    var postUri = Uri.parse(url);

    var request = http.MultipartRequest('POST', postUri);
    request.fields['creation_date'] = "${DateTime.now()}";
    request.files.add(await http.MultipartFile.fromPath(
      'song',
      _audioFile!.path,
    ));
    var response = await request.send();
    final responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body)['data'];
    print(responseData);

    // call the predict functionality here and return a prediction
    String getU = "$apiUrl/genus/predict/";
    var getUrl = Uri.parse(getU);
    var req = http.MultipartRequest('GET', getUrl);
    var res = await req.send();
    var responses = await http.Response.fromStream(res);
    var resData = json.decode(responses.body)['data'];
    print(res.statusCode);

    setState(() {
      predicted = resData;
    });
    // return resData;
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 28, 35, 39),
                Color.fromARGB(255, 255, 255, 255)
              ],
            ),
          ),
          child: _audioFile != null
              ? Container(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  child: predicted == null
                      ? Column(
                          children: [
                            const Text("Audio Selected:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: screenHeight * 0.05),
                            Container(
                              height: screenHeight * 0.08,
                              width: screenWidth * 0.7,
                              child: Text('$name',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 24.0,
                                    // backgroundColor: Color.fromARGB(255, 104, 104, 104)
                                  )),
                            ),
                            SizedBox(height: screenHeight * 0.05),
                            Container(),
                            CoolButton(
                                label: "predict",
                                onPressed: () {
                                  setState(() {});
                                  predict(_audioFile);
                                },
                                icon: Icons.radar),
                            SizedBox(height: 20.0),
                          ],
                        )
                      : Column(
                          children: [Text(predicted.toString())],
                        ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Genus",
                        style: TextStyle(
                          color: Color.fromARGB(255, 205, 204, 204),
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Container(),
                    SizedBox(height: screenHeight * 0.1),
                    CoolButton(
                      label: "Add",
                      onPressed: _pickAudioFile,
                      icon: Icons.add,
                    ),
                    SizedBox(height: 40),
                    CoolButton(
                        label: "Record",
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/record');
                        },
                        icon: Icons.mic),
                  ],
                )),
    );
  }
}

class CoolButton extends StatelessWidget {
  final String label;
  final onPressed;
  final icon;

  const CoolButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenHeight * 0.09,
        width: screenWidth * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 50, 56),
              Color.fromARGB(255, 83, 85, 91)
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 83, 83, 83).withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(height: screenHeight * 0.01),
          Icon(
            icon,
            color: Colors.white,
            size: screenWidth * 0.085,
          ),
          // SizedBox(height: 5,),
          Text(
            label,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
