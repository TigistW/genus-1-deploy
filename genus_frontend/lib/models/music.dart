import '';

class Music {
  final String? id;
  final String? name;
  final String? artist;
  final String? genre;
  final String? image;
  final double? size;
  final String? file;

  // the music instance constructor
  Music({this.id, this.name, this.artist, this.size, this.genre, this.image, this.file});

// a method that deserializes a json instance of the music model from the backend
  factory Music.fromJson(Map<String, dynamic> json) {

    return Music(
      id: json['id'],
      name: json['title'] ?? "",
      genre: json['genre'] ?? "",
      artist: json['artist'] ?? "",
      size: json['length'] ?? "",
      image: json['thumbnail'] ?? "",
      file: json['song'] ?? "",
    );
  }

  // converting the instance of the class values into a string
  @override
  String toString() =>
      '{id: $id, title:$name,artist:$artist, length: $size, genre:$genre, thumbnail: $image, song:$file}';

//  the parameters as a list
  List<Object?> get props => [id, name, artist, size, genre, image, file];
}
