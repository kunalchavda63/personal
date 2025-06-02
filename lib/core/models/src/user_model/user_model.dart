import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? name,
    @JsonKey(name: 'username') String? userName, // needed
    String? email,
    AddressModel? address,
    String? phone,
    String? website,
    CompanyModel? company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    GeoModel? geo,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
abstract class GeoModel with _$GeoModel {
  const factory GeoModel({String? lat, String? lng}) = _GeoModel;

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);
}

@freezed
abstract class CompanyModel with _$CompanyModel {
  const factory CompanyModel({String? name, String? catchPhrase, String? bs}) =
      _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}
