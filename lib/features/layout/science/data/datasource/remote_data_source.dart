import 'package:news/core/api/dio_helper.dart';

import '../../../../../data/models/news_data_model.dart';

abstract class ScienceRemoteDataSource {
  Future<NewsDataModel> getScienceData();
}

class ScienceRemoteDataSourceImpl implements ScienceRemoteDataSource {
  final DioHepler dioHepler;
  ScienceRemoteDataSourceImpl({required this.dioHepler});
  @override
  Future<NewsDataModel> getScienceData() async {
    final response = await dioHepler.getCategory("us", "science");
    return NewsDataModel.fromjson(response);
  }
}
