import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
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

  void _pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      String? filePath = result.files.first.path;
      if (filePath != null) {
        setState(() {
          _audioFile = File(filePath);
          // OpenFile.open(_audioFile.path);
        });
      }
    }
  }

  void trial() async {
    print("---------------------------");
    String url = "http://192.168.43.250:8000/genus/trial/";
    var postUri = Uri.parse(url);
    var request = http.Request('GET', postUri);
    print(request.body);
    print(request.toString());
    var response = await request.send();
    print(";;;;;");
    print(response.toString());
    print(response.statusCode);
    // print(response['data']);
  }

  void predict(File? _audioFile) async {
    print("----------------------------------");
    String? fileName = _audioFile?.path.split('/').last;
    String url = "http://192.168.43.250:8000/genus/add/";
    var postUri = Uri.parse(url);
    print(postUri);

    var request = http.MultipartRequest('POST', postUri);
    request.fields['creation_date'] = "${DateTime.now()}";
    request.files.add(await http.MultipartFile.fromPath(
      'song',
      _audioFile!.path,
    ));
    print(request.toString());
    print("-------------------REQUEST------------------------");
    print(request.toString());
    print("-------------------RESPONSE------------------------");
    var response = await request.send();
    final responsed = await http.Response.fromStream(response);

    print(responsed.toString());
    final responseData = json.decode(responsed.body)['data'];
    print(responseData);
    print("-------------------RESPONSEDATA------------------------");

    // call the predict functionality hereeea and return a prediction

    String getU = "http://192.168.43.250:8000/genus/predict/";
    var getUrl = Uri.parse(getU);
    var req = http.MultipartRequest('GET', getUrl);
    var res = await req.send();
    print(res.statusCode);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 72, 13, 166),
                Color.fromARGB(255, 203, 37, 112)
              ],
            ),
          ),
          child: _audioFile != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Music Selected",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold)),
                    Text("$_audioFile",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold)),
                    Container(),
                    ElevatedButton(
                      child: const Text("Predict",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        setState(() {});
                        predict(_audioFile);
                      },
                    ),
                    const SizedBox(height: 20.0),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Input Music",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold)),
                    Container(),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      child: Text("Select Audio File",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: _pickAudioFile,
                    ),
                    ElevatedButton(
                      child: Text("trial",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: trial,
                    ),
                  ],
                )),
    );
  }
}
