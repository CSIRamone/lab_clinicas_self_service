import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self-service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self-service/widget/lab_clinicas_sef_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentsScanConfirmPage extends StatelessWidget {
   DocumentsScanConfirmPage({super.key});

  final controller = Injector.get<DocumentsScanConfirmController>();

  @override
  Widget build(BuildContext context) {
    final foto = ModalRoute.of(context)!.settings.arguments as XFile;
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasSefServiceAppBar(),
      body: Align(
        alignment: AlignmentGeometry.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * 0.98,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/foto_confirm_icon.png'),
                const SizedBox(height: 24),
                const Text(
                  'Confira sua foto',
                  style: LabClinicasTheme.titleSmallStyle,
                ), 
                const SizedBox(height: 32),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: sizeOf.width * 0.65,
                    
                    child: DottedBorder(
                      dashPattern: const [1,10,1,3],
                      borderType: BorderType.RRect,
                      strokeWidth: 4,
                      radius: const Radius.circular(16),
                      color: LabClinicasTheme.orangeColor,
                      strokeCap: StrokeCap.square,
                      child: Image.file(File(foto.path)))),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Tirar outra foto',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LabClinicasTheme.orangeColor,
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Salvar',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
