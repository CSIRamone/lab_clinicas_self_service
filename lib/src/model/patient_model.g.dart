// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
  name: json['name'] as String,
  email: json['email'] as String,
  phoneNamber: json['phone_namber'] as String,
  document: json['document'] as String,
  address: PatientAddressModel.fromJson(
    json['address'] as Map<String, dynamic>,
  ),
  guardian: json['guardian'] as String? ?? '',
  guardianIdentificationNumber:
      json['guardian_identification_number'] as String? ?? '',
);

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_namber': instance.phoneNamber,
      'document': instance.document,
      'address': instance.address,
      'guardian': instance.guardian,
      'guardian_identification_number': instance.guardianIdentificationNumber,
    };
