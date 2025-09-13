import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/widget/lab_clinicas_sef_service_app_bar.dart';
import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {

  const DocumentsPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: LabClinicasSefServiceAppBar(

           ),
           body: Container(
            child: const Text('documents'),
           ),
       );
  }
}