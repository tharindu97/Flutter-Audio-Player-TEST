class Quote{

  late final String author;
  late final String category;
  late final String quote;
  late final String image;

  Quote({required this.author, required this.category, required this.quote,  required this.image});

  factory Quote.fromJson(Map<String, dynamic> data){
    return Quote(
        author: data["author_f_name"],
        category: data["quote_category"],
        quote: data["quote_text_1"],
        image: data["quote_image_url"]
    );
  }

}