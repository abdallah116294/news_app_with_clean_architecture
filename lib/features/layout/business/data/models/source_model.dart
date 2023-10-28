import 'package:news/features/layout/business/domain/entities/get_business_source_entities.dart';

class BusinessSourceModel extends BusinessSource {
  BusinessSourceModel({required super.id, required super.name});
  factory BusinessSourceModel.fromJson(Map<String, dynamic> json) {
    return BusinessSourceModel(id: json["id"], name: json["name"]);
  }
}
