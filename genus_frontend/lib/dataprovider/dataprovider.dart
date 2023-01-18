import 'dart:convert';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:genus_frontend/models/music.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicDataprovider {
  final http.Client httpClient;
  MusicDataprovider({required this.httpClient});

  String apiUrl = "";

// setting the mp3 file inot a wav format
  Future<Response> predict(String file) async {
    var response = await httpClient.get(
      Uri.parse('$apiUrl/something'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to get music');
    }
  }


//  adding music to history
  Future<Music> addMusic(String genre, String file) async {
    var response = await httpClient.get(
      Uri.parse('$apiUrl/something'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return Music.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to get music');
    }
  }


// a method for predicting a multiple file selection


}
