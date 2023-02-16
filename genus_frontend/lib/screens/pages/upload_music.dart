// void _pickAudioFile() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   if (result != null && result.files.isNotEmpty) {
//     String? filePath = result.files.first.path;
//     if (filePath != null) {
//       setState(() {
//         _audioFile = File(filePath);
//         print(_audioFile.absolute);
//         print(">>>>>>>>>>>>>>>>>>>>>.");
//         _submitMp3(_audioFile);
//         // convert(_audioFile.path);

//         OpenFile.open(_audioFile.path);
//       });
//     }
//   }
// }

// // void convert(audioFilePath) async {
// //   print("entering convert");
// //   String inputFile = audioFilePath;
// //   print(inputFile);
// //   // String outputFile = '/genus_frontend/assets/music.wav';
// //   FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();
// //   await flutterFFmpeg
// //       .execute('-i $inputFile -acodec pcm_s16le -ar 44100  music.wav ');
// //   // '-i $inputFile -acodec pcm_s16le -ar 44100 $outputFile + ".wav"');
// //   _submitForm("music.wav");
// // }

// // void _submitForm(path) async {
// //   print("????????????????????????????????????????/");
// //   var postUri = Uri.parse("http://127.0.0.1:8000/genus/add");
// //   print(postUri);
// //   http.MultipartRequest request = http.MultipartRequest("POST", postUri);
// //   http.MultipartFile multipartFile =
// //       await http.MultipartFile.fromPath('file', _audioFile.path);
// //   request.files.add(multipartFile);
// //   http.StreamedResponse response = await request.send();
// //   print(response.statusCode);
// // }

// void _submitMp3(_audioFile) async {
//   print("LLLLLLLLLLLLLLLLLLLLLLLL");

//   String url = "http://192.168.43.250:9000/genus/add";

//   var postUri = Uri.parse(url);
//   print(postUri);

//   try {
//     http.MultipartRequest request = http.MultipartRequest("POST", postUri);
//     http.MultipartFile multipartFile =
//         await http.MultipartFile.fromPath('file', _audioFile.path);
//     request.files.add(multipartFile);
//     http.StreamedResponse response = await request.send();
//     print("HHHHHHHHHHHHHHHHHHHH");
//     print(response.statusCode);
//   } catch (e) {
//     print("loooooooooooooooooooooooooooooooooo");
//     print(e.toString());
//   }
// }



// mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //   const Text("Input Music",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 24.0,
            //           fontWeight: FontWeight.bold)),
            //   Container(),
            //   const SizedBox(height: 20.0),
            //   const ElevatedButton(
            //     child: Text("Select Audio File",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     // onPressed: _pickAudioFile,
            //   ),
            // ],