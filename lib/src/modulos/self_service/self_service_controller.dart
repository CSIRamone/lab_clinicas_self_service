import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIAm, findPatient, patient, documents, done, restart }

class SelfServiceController with MessageStateMixin {

var _model = const SelfServiceModel();

  final _step = signal(FormSteps.none);

  FlutterSignal<FormSteps> get step => _step;

  void startProcess(){
    _step.value = FormSteps.whoIAm;
  }

  void setWhoIAmDataSetAndNext(String name, String lastName){
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

}
