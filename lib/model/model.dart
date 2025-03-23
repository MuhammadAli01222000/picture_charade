class PictureCharade {
  final ImageCard left;
  final ImageCard right;
  final String description;
  final String word;
  final List<String> letters;
  final String imageUrl;
  final int leftLetter;
  final int rightLetter;
  final int middleLetter;
  final int level;
  final int coin;

  const PictureCharade({
    required this.left,
    required this.right,
    required this.description,
    required this.word,
    required this.letters,
    required this.imageUrl,
    required this.leftLetter,
    required this.rightLetter,
    required this.middleLetter,
    required this.level,
    required this.coin,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PictureCharade &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          right == other.right &&
          description == other.description &&
          word == other.word &&
          letters == other.letters &&
          imageUrl == other.imageUrl &&
          leftLetter == other.leftLetter &&
          rightLetter == other.rightLetter &&
          middleLetter == other.middleLetter &&
          level == other.level &&
          coin == other.coin);

  @override
  int get hashCode =>
      left.hashCode ^
      right.hashCode ^
      description.hashCode ^
      word.hashCode ^
      letters.hashCode ^
      imageUrl.hashCode ^
      leftLetter.hashCode ^
      rightLetter.hashCode ^
      middleLetter.hashCode ^
      level.hashCode ^
      coin.hashCode;

  @override
  String toString() {
    return 'PictureCharade{' ' left: $left,' ' right: $right,' ' description: $description,' ' word: $word,' +
        ' letters: $letters,' +
        ' imageUrl: $imageUrl,' +
        ' leftLetter: $leftLetter,' +
        ' rightLetter: $rightLetter,' +
        ' middleLetter: $middleLetter,' +
        ' level: $level,' +
        ' coin: $coin,' +
        '}';
  }

  PictureCharade copyWith({
    ImageCard? left,
    ImageCard? right,
    String? description,
    String? word,
    List<String>? letters,
    String? imageUrl,
    int? leftLetter,
    int? rightLetter,
    int? middleLetter,
    int? level,
    int? coin,
  }) {
    return PictureCharade(
      left: left ?? this.left,
      right: right ?? this.right,
      description: description ?? this.description,
      word: word ?? this.word,
      letters: letters ?? this.letters,
      imageUrl: imageUrl ?? this.imageUrl,
      leftLetter: leftLetter ?? this.leftLetter,
      rightLetter: rightLetter ?? this.rightLetter,
      middleLetter: middleLetter ?? this.middleLetter,
      level: level ?? this.level,
      coin: coin ?? this.coin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'left': left,
      'right': right,
      'description': description,
      'word': word,
      'letters': letters,
      'imageUrl': imageUrl,
      'leftLetter': leftLetter,
      'rightLetter': rightLetter,
      'middleLetter': middleLetter,
      'level': level,
      'coin': coin,
    };
  }
  factory PictureCharade.fromMap(Map<String, dynamic> map) {
    return PictureCharade(
      left: ImageCard.fromMap(map['left'] as Map<String, dynamic>),
      right: ImageCard.fromMap(map['right'] as Map<String, dynamic>),
      description: map['description'] as String,
      word: map['word'] as String,
      letters: List<String>.from(map['letters'] as List<dynamic>),
      imageUrl: map['imageUrl'] as String,
      leftLetter: map['leftLetter'] as int,
      rightLetter: map['rightLetter'] as int,
      middleLetter: map['middleLetter'] as int,
      level: map['level'] as int,
      coin: map['coin'] as int,
    );
  }

}



class ImageCard {
  final String imageUrl;
  final int color;
  final int length;
  final int fill;
  final String name;

  const ImageCard({
    required this.imageUrl,
    required this.color,
    required this.length,
    required this.fill,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageCard &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          color == other.color &&
          length == other.length &&
          fill == other.fill &&
          name == other.name);

  @override
  int get hashCode =>
      imageUrl.hashCode ^
      color.hashCode ^
      length.hashCode ^
      fill.hashCode ^
      name.hashCode;

  @override
  String toString() {
    return 'ImageCard{' ' imageUrl: $imageUrl,' ' color: $color,' ' length: $length,' ' fill: $fill,' +
        ' name: $name,' +
        '}';
  }

  ImageCard copyWith({
    String? imageUrl,
    int? color,
    int? length,
    int? fill,
    String? name,
  }) {
    return ImageCard(
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      length: length ?? this.length,
      fill: fill ?? this.fill,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'color': color,
      'length': length,
      'fill': fill,
      'name': name,
    };
  }factory ImageCard.fromMap(Map<String, dynamic> map) {
    return ImageCard(
      imageUrl: map['imageUrl'] as String,
      color: int.parse("0xFF${map['color'] as String}"), // ✅ HEX to int
      length: map['length'] as int,
      fill: map['fill'] as int,
      name: map['name'] as String,
    );
  }

}
