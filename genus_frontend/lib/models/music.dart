class Music {
  final String? id;
  final String? date;
  final String? file;

  // the music instance constructor
  Music({this.id, this.date, this.file});

// a method that deserializes a json instance of the music model from the backend
  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'],
      date: json['creation_date'] ?? "",
      file: json['song'] ?? "",
    );
  }

// a method to serialize the model into a json format for the backend
    Map<String, dynamic> toJson() {
    return {"id": id, "file": file, "date": date};
  }

  // converting the instance of the class values into a string
  @override
  String toString() =>
      '{id: $id, song:$file, creation_date:$date}';

//  the parameters as a list
  List<Object?> get props => [id, date, file];
}
