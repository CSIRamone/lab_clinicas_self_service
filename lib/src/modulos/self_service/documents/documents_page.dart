import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/documents/widgets/document_box_widget.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/widget/lab_clinicas_sef_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Image.asset('assets/images/folder.png'),
                const SizedBox(height: 24),
                const Text(
                  'Adicionar Documento',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Selecione o documento que deseja fotografar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: LabClinicasTheme.blueColor,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: sizeOf.width * 0.8,
                  height: 188,
                  child: Row(
                    children: [
                      DocumentBoxWidget(
                        uploaded: false,
                        icon: Image.asset('assets/images/id_card.png'),
                        label: 'Carteirinha',
                        totalFiles: 2,
                      ),
                      const SizedBox(width: 12),
                      DocumentBoxWidget(
                        uploaded: false,
                        icon: Image.asset('assets/images/document.png'),
                        label: 'Pedido médico',
                        totalFiles: 4,
                      ),
                    ],
                  ),
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
                        onPressed: () {},
                        child: const Text(
                          'Remover todas',
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
                          'Finalizar',
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
