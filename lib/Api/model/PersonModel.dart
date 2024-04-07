class Person {
  final String quote;
  final String author;

  const Person({required this.quote, required this.author});
  
factory Person.fromJson(Map<String, dynamic> json){
  return switch (json) {
     {'quote':String quote ,
    'author':String author,

  }=>
  Person(quote: quote,author: author ),
_=> throw const FormatException('Failed to load album.'),
};
}
}
