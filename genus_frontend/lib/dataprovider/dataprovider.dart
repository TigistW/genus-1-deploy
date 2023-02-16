import 'dart:convert';
import 'dart:io';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:genus_frontend/models/music.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicDataprovider {
  final http.Client httpClient;
  MusicDataprovider({required this.httpClient});

  String apiUrl = "";

  void trial() async {
    print("---------------------------");
    String url = "http://192.168.43.250:8000/genus/trial";
    var postUri = Uri.parse(url);
    var request = http.Request('GET', postUri);
    print(request.body);
    print(request.toString());
    var response = await request.send();
    print(";;;;;");
    print(response.toString());
  }


  void predict(File? _audioFile) async {
    print("----------------------------------");
    String? fileName = _audioFile?.path.split('/').last;
    String url = "http://192.168.43.250:8000/genus/add";
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
    print("-------------------RESPONSEDATA------------------------");
  }

  


}
