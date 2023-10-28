import 'package:news/core/api/dio_helper.dart';
import 'package:news/features/layout/business/data/models/business_data_model.dart';

abstract class GetBusinessRemoteDataSource {
  Future<BusinessDataModel> getBusinessData();
}

class GetBusinessRemoteDataSourceImpl implements GetBusinessRemoteDataSource {
  final DioHepler dioHepler;
  GetBusinessRemoteDataSourceImpl({required this.dioHepler});
  @override
  Future<BusinessDataModel> getBusinessData()async {
    var response =await dioHepler.getCategory("us", "business");
    return BusinessDataModel.fromJson(response);
  }
}
