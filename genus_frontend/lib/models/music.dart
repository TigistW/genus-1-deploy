import '';

class Music {
  final String? id;
  final String? name;
  final String? artist;
  final String? genre;
  final String? image;
  final double? size;

  // the music instance constructor
  Music({this.id, this.name, this.artist, this.size, this.genre, this.image});

// a method that deserializes a json instance of the music model from the backend
  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['_id'],
      name: json['name'] ?? "",
      genre: json['genre'] ?? "",
      artist: json['artist'] ?? "",
      size: json['size'] ?? "",
      image: json['image'] ?? "",
    );
  }

   @override
  String toString() =>
      '{_id: $id, name:$name,artist:$artist, size: $size, genre:$genre, image: $image}';

  @override
  List<Object?> get props =>
      [id, name, artist, size, genre, image];
}
