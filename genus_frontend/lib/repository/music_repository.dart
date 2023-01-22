import 'package:http/http.dart';

import '../dataprovider/dataprovider.dart';
import '../models/music.dart';

class MusicRepository {
  final MusicDataprovider musicDataprovider;

  MusicRepository({required this.musicDataprovider});

  Future<Response> music_method({required String file}) async {
    return await musicDataprovider.uploadMusicForPrediction(file: file);
  }
}
