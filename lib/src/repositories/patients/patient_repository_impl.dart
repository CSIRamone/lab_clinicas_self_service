
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';

import './patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final RestClient restClient;
  PatientRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
    String document,
  ) async {
    try {
      final Response(:List data) = await restClient.auth.get(
        '/patients',
        queryParameters: {'document': document},
      );

      if (data.isEmpty) {
        log('Nenhum paciente encontrado para o documento: $document');
        return Right(null);
      }

      if (data.isEmpty) {
        return Right(null);
      }
    
      /*final Response response = await restClient.auth.get(
        '/patients',
        queryParameters: {'document': document},
        options: Options(
          // Forçamos a resposta a ser do tipo 'plain text'
          responseType: ResponseType.plain,
        ),
      );

      // Verificação de segurança: a resposta deve conter um corpo
      if (response.data == null || (response.data as String).isEmpty) {
        return Right(null);
      }
      
      // Desserializamos o JSON manualmente
      final responseData = jsonDecode(response.data);

      // Se a resposta for um Map, colocamo-lo numa lista para consistência.
      final List data = (responseData is Map) ? [responseData] : responseData;

      if (data.isEmpty) {
        log('Nenhum paciente encontrado para o documento: $document');
        return Right(null);
      }*/

      return Right(PatientModel.fromJson(data.first));

    } on DioException catch (e, s) {
      log('Erro ao buscar paciente por cpf', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
  
  @override
  Future<Either<RepositoryException, Unit>> update(PatientModel patient) async {
    try {
  await restClient.auth.put('/patients/${patient.id}', data: patient.toJson());
  return Right(unit);
} on DioException catch (e, s) {
  log('Erro ao atualizar o paciente', error: e, stackTrace: s);
  return Left(RepositoryException());
 
}
  }
}
