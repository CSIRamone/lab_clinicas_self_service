import 'package:fe_lab_clinicas_self_service/src/modulos/self-service/find_patient/find_patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self-service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicasSefServiceAppBar extends LabClinicasAppBar {
  LabClinicasSefServiceAppBar({super.key})
    : super(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Chama a função para resetar o estado antes de voltar
            Injector.get<FindPatientController>().resetState();
            Injector.get<SelfServiceController>().restartPatientProcess();
            
          },
        ),
        actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Reiniciar processo'),
                ),
              ];
            },
            onSelected: (value) async {
              Injector.get<SelfServiceController>().restartProcess();
            },
          ),
        ],
      );
}
