import 'package:equatable/equatable.dart';

class BusinessSource extends Equatable {
  String? id;
  String? name;
  BusinessSource({required this.id, required this.name});
  @override
  List<Object?> get props => [
    id,
    name,
  ];
}
