import 'package:equatable/equatable.dart';
import 'package:news/features/layout/business/domain/entities/get_business_articles_entities.dart';

class GetBusinessData extends Equatable {
  final String status;
  final int totalResults;
  List<BusinessArticles>? articles;
  GetBusinessData(
      {required this.status,
      required this.totalResults,
      required this.articles});
  @override
  List<Object?> get props => [
        status,
        totalResults,
        articles,
      ];
}
