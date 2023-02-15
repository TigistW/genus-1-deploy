import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
// import 'package:flutter_audio_features/flutter_audio_features.dart';

class AudioInputPage extends StatefulWidget {
  @override
  _AudioInputPageState createState() => _AudioInputPageState();
}

class _AudioInputPageState extends State<AudioInputPage> {
  late File _audioFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 72, 13, 166),
              Color.fromARGB(255, 203, 37, 112)
            ],
          ),
        ),

        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Input Music",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
              Container(),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text("Select Audio File",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                // onPressed: _pickAudioFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
