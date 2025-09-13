
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  
  final PatientRepository _repository;
  
  PatientController({
    required PatientRepository repository,
  }) : _repository = repository;

  PatientModel? patient;

final nextStep = signal<bool>(false);

  void goNextStep(){
    nextStep.value = true;
  }

  void resetNextStep(){
    nextStep.value = false;
  }
  
  Future<void> updateAndNext(PatientModel model) async {
    final updateResult = await _repository.update(model);

    switch(updateResult){
      case Left():
      showError('Erro ao atualizar dados do paciente, chame o atendente');
      case Right():
      showInfo('Paciente atualizado com sucesso');
      patient = model;
      goNextStep();

    }
  }
  
  Future<void> saveAndNext(RegisterPatientModel registerPatientModel) async {
    final result = await _repository.register(registerPatientModel);
    switch(result){
      case Left():
      showError('Erro ao cadastrar paciente, chame o atendente');
      case Right(value: final patient):
      showInfo('Paciente cadastro com sucesso');
      this.patient = patient;
      goNextStep();
    }
  }

}
