import 'dart:convert';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:genus_frontend/models/music.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicDataprovider {
  final http.Client httpClient;
  MusicDataprovider({required this.httpClient});

  String apiUrl = "";


// setting the mp3 file to the backend
Future<Response> uploadMusicForPrediction({
    required String file
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('$apiUrl/someurl'));
    request.files.add(await http.MultipartFile.fromPath(
      'song',
      file,
    ));

    var response = await request.send();
    final responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body)['data'];
    return responseData;
  }



// //  receiving the predition we got based on the id of the mp3 format
// Future<Response> getPrediction() async {
//     var response = await httpClient.get(
//       Uri.parse('$apiUrl/user'),
//       headers: <String, String>{
//         'Content-Type': 'application/json'
//       },
//     );

//     if (response.statusCode == 200) {
//       return response;
//     } else {
//       throw Exception('Failed to get user');
//     }
//   }


// a method for predicting a file selection
  // Future<Response> saveMusic({
  //   required String name,
  //   required String genre,
  //   required String artist,
  //   required String size,
  //   required String image,
  // }) async {
  //   var request = http.MultipartRequest('POST', Uri.parse('$apiUrl/user'));

  //   request.fields['title'] = name;
  //   request.fields['genre'] = genre;
  //   request.fields['length'] = size;
  //   request.fields['artist'] = artist;

  //   request.files.add(await http.MultipartFile.fromPath(
  //     'thumbnail',
  //     image,
  //   ));

  //   var response = await request.send();
  //   final responsed = await http.Response.fromStream(response);
  //   final responseData = json.decode(responsed.body)['data'];

  //   return responseData;
  // }

}
