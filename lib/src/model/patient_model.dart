import 'package:fe_lab_clinicas_self_service/src/model/patient_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {

    PatientModel({required this.name, required this.email, required this.phoneNamber, required this.document, required this.address, required this.guardian, required this.guardianIdentificationNumber,});

  final String name;
  final String email;

  @JsonKey(name: 'phone_namber')
  final String phoneNamber;

  final String document;

  final PatientAddressModel address;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;
@JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
