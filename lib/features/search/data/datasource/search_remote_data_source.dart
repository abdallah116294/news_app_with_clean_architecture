import 'package:news/core/api/dio_helper.dart';
import 'package:news/data/models/news_data_model.dart';

abstract class SearchRemoteDataSource {
  Future<NewsDataModel> searchData(String item);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final DioHepler dioHepler;
  SearchRemoteDataSourceImpl({required this.dioHepler});
  @override
  Future<NewsDataModel> searchData(String item) async {
    var response = await dioHepler.getSearchItems(item);
    return NewsDataModel.fromjson(response);
  }
}
