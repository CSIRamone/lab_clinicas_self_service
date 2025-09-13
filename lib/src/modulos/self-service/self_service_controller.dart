import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIAm, findPatient, patient, documents, done, restart }

class SelfServiceController with MessageStateMixin {
  var _model = const SelfServiceModel();
  SelfServiceModel get model => _model;

  final _step = signal(FormSteps.none);

  FlutterSignal<FormSteps> get step => _step;

  void startProcess() {
    _step.value = FormSteps.whoIAm;
  }

  void setWhoIAmDataSetAndNext(String name, String lastName) {
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _step.value = FormSteps.findPatient;
  }

  void debug() {
    print(_model.name);
    print(_model.lastName);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.value = FormSteps.patient;
  }

  void restartProcess() {
    _step.value = FormSteps.restart;
    clearForm();
  }
  void restartPatientProcess() {
  switch (_step.value) {
    case FormSteps.patient:
      _step.value = FormSteps.findPatient;
      clearForm();
      break;
    case FormSteps.documents:
      _step.value = FormSteps.patient;
      clearForm();
      break;
    case FormSteps.findPatient:
      _step.value = FormSteps.whoIAm;
      clearForm();
      break;
    case FormSteps.none:
     _step.value = FormSteps.none;
     clearForm();
     break;
     case FormSteps.whoIAm:
     _step.value = FormSteps.restart;
     clearForm();
     break;
     case FormSteps.done:
     _step.value = FormSteps.whoIAm;
     clearForm();
     break;
     case FormSteps.restart:
     _step.value = FormSteps.restart;
     clearForm();
     break;
  }
}

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.value = FormSteps.documents;
  }

  void registerDocument(DocumentType type, String filePath){
    final documents = _model.documents ?? {};
    if(type == DocumentType.healthInsuranceCard){
      documents[type]?.clear();
    }
    final values = documents[type] ?? [];
    values.add(filePath);
    documents[type] = values;
    _model = _model.copyWith(documents: () => documents);

  }
  void clearDocuments(){
    _model = _model.copyWith(documents: () => {});
  }
}
