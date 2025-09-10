import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({required PatientRepository patientRepository})
    : _patientRepository = patientRepository;

  final PatientRepository _patientRepository;

  final _patientNotFound = signal<bool?>(null);
  final _patient = signal<PatientModel?>(null);

  PatientModel? get patient => _patient();
  bool? get patientNotFound => _patientNotFound();

  Future<void> findPatientByDocument(String document) async {
    final patientResult = await _patientRepository.findPatientByDocument(
      document,
    );

    bool patientNotFound;
    PatientModel? patient;

    switch (patientResult) {
      case Right(value: PatientModel modelPatient?):
        patientNotFound = false;
        patient = modelPatient;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left():
        showError('Erro ao buscar pacient');
        return;
    }

    batch(() {
      _patient.value = patient;
      _patientNotFound.value = patientNotFound;
    });
  }

  void resetState() {
    batch(() {
      _patient.value = null;
      _patientNotFound.value = null;
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.value = null;
      _patientNotFound.value = true;
    });
  }
}
