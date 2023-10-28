import 'package:news/core/api/dio_helper.dart';
import 'package:news/data/models/news_data_model.dart';

abstract class RemoteDataSource {
  Future<NewsDataModel> getNewsDataModel();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioHepler dioHeler;
  RemoteDataSourceImpl({required this.dioHeler});
  @override
  Future<NewsDataModel> getNewsDataModel() async {
    final response = await dioHeler.getCategory("us","sports");
    // debugPrint(response.);
    return NewsDataModel.fromjson(response);
  }
}
