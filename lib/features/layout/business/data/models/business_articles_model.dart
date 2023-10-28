import 'package:news/features/layout/business/data/models/source_model.dart';

import '../../domain/entities/get_business_articles_entities.dart';

class BusinessArticlesModel extends BusinessArticles {
  BusinessArticlesModel(
      {required super.source,
      required super.auther,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});
  factory BusinessArticlesModel.fromJson(Map<String, dynamic> json) {
    return BusinessArticlesModel(
        source: json["source"]!=null? BusinessSourceModel.fromJson(json):null,
        auther:json["auther"] ,
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"]);
  }
}
