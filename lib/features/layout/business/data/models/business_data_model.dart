import 'package:news/features/layout/business/domain/entities/get_business_data_entities.dart';

import 'business_articles_model.dart';

class BusinessDataModel extends GetBusinessData {
  BusinessDataModel(
      {required super.status,
      required super.totalResults,
      required super.articles});
  factory BusinessDataModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? articleList = json["articles"] as List<dynamic>?;
    List<BusinessArticlesModel> articles = [];
    if (articleList != null) {
      articles = articleList
          .map((articleJson) => BusinessArticlesModel.fromJson(articleJson))
          .toList();
    }
    return BusinessDataModel(articles:articles, status: json["status"], totalResults: json["totalResults"]);
  }
}
