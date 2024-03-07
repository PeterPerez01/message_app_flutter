enum fromWho {me, hers}


class Message {
  final String text;
  final String? imageUrl;
  final fromWho FromWho;

  Message ({
    required this.text,
    this.imageUrl,
    required this.FromWho,
  });
}