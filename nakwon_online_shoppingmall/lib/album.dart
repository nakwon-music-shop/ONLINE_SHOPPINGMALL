class Album {
  final String imagePath;
  final String song;
  final String artist;
  final int price;
  final String description;
  int quantity; // quantity 필드 추가

  Album({
    required this.imagePath,
    required this.song,
    required this.artist,
    required this.price,
    required this.description,
    this.quantity = 1, // 기본값 1로 설정
  });
}
