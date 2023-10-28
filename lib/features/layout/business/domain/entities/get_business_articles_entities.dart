import 'package:equatable/equatable.dart';

import 'get_business_source_entities.dart';

class BusinessArticles extends Equatable{
  BusinessSource? source;
  String? auther;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  BusinessArticles({
    required this.source,
    required this.auther,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  }); 
 @override

  List<Object?> get props => [
    source,
    auther,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
  
}