import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentBoxWidget extends StatelessWidget {
  final bool uploaded;
  final Widget icon;
  final String label;
  final int totalFiles;

  const DocumentBoxWidget({
    Key? key,
    required this.uploaded,
    required this.icon,
    required this.label,
    required this.totalFiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalFilesLabel = totalFiles > 0 ? '($totalFiles)' : '';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: uploaded ? LabClinicasTheme.ligthOrangeColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LabClinicasTheme.orangeColor),
        ),
        child: Column(
          children: [
            Expanded(child: icon),
            Text(
              '$label  $totalFilesLabel',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: LabClinicasTheme.orangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
