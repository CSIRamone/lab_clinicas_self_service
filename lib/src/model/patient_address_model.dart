import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  PatientAddressModel({
    required this.cep,
    required this.streetAddress,
    required this.number,
    required this.addressComplement,
    required this.state,
    required this.city,
    required this.district,
  });

  final String cep;
  final String number;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  @JsonKey(name: 'address_complement')
  final String addressComplement;
  final String state;
  final String city;
  final String district;

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);

  PatientAddressModel copyWith({
    String? cep,
    String? number,
    String? streetAddress,
    String? addressComplement,
    String? state,
    String? city,
    String? district,
  }) {
    return PatientAddressModel(
      cep: cep ?? this.cep,
      number: number ?? this.number,
      streetAddress: streetAddress ?? this.streetAddress,
      addressComplement: addressComplement ?? this.addressComplement,
      state: state ?? this.state,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }
}
