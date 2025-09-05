import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIAm, findPatient, patient, documents, done, restart }

class SelfServiceController with MessageStateMixin {
  final _step = signal(FormSteps.none);

  FlutterSignal<FormSteps> get step => _step;

  void startProcess(){
    _step.value = FormSteps.whoIAm;
  }

}
