import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_self_service/src/binding/lab_clinicas_application_binding.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/auth/auth_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/home/home_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/self_service_module.dart';
import 'package:fe_lab_clinicas_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

void main() {
  runZonedGuarded((){
  runApp(const LabClinicasSelfServiceApp());
  }, (error, stack) {
    // ignore: avoid_print
    log('Erro não capturado:' , error: error, stackTrace: stack);
    // ignore: avoid_print
    throw error;
  });
}

class LabClinicasSelfServiceApp extends StatelessWidget {
  const LabClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clínicas Auto Atendimento',
      bindings: LabClinicasApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      modules: [
        AuthModule(),
        HomeModule(),
        SelfServiceModule(),
      ],
    );
  }
}
