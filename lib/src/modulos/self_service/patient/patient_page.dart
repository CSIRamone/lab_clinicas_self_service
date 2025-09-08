import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/widget/lab_clinicas_sef_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> with PatientFormController{

  final formKey = GlobalKey<FormState>();


@override
  void dispose() {
    disposeForm();
    super.dispose();
  }

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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/images/check_icon.png'),
                  const SizedBox(height: 24),
                  const Text(
                    'Cadastro encontrado',
                    style: LabClinicasTheme.titleSmallStyle,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Confirma os dados do seu cadastro',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LabClinicasTheme.blueColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                    decoration: const InputDecoration(
                      label: Text('Nome Paciente'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required('Email obrigatório'),
                      Validatorless.email('Email inválido'),
                    ]),
                    controller: emailEC,
                    decoration: const InputDecoration(label: Text('Email')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: Validatorless.required('Telefone Obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    controller: phoneEC,
                    decoration: const InputDecoration(
                      label: Text('Telefone de Contato'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: Validatorless.required('CPF Obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    controller: documentEC,
                    decoration: const InputDecoration(
                      label: Text('Digite o seu CPF'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: Validatorless.required('CEP Obrigatório'),
                     inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    controller: cepEC,
                    decoration: const InputDecoration(label: Text('CEP')),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          validator: Validatorless.required('Endereço Obrigatório'),
                          controller: streetEC,
                          decoration: const InputDecoration(
                            label: Text('Endereço'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          validator: Validatorless.required('Número Obrigatório'),
                          controller: numberEC,
                          decoration: const InputDecoration(
                            label: Text('Número'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: complementEC,
                          decoration: const InputDecoration(
                            label: Text('Complemento'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          validator: Validatorless.required('Estado Obrigatório'),
                          controller: stateEC,
                          decoration: const InputDecoration(
                            label: Text('Estado'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: Validatorless.required('Cidade Obrigatória'),
                          controller: cityEC,
                          decoration: const InputDecoration(
                            label: Text('Cidade'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          validator: Validatorless.required('Bairro Obrigatório'),
                          controller: districtEC,
                          decoration: const InputDecoration(
                            label: Text('Bairro'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: guardianEC,
                    decoration: const InputDecoration(label: Text('Responsável')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: guardianIdentificationNumberEC,
                     inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Documento de identificão'),
                    ),
                  ),
                  const SizedBox(height: 32.5),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {}, 
                            child: const Text('Editar'),),
                        ),
                      ),
                      const SizedBox(width: 17,),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {}, 
                            child: const Text('Continuar'),),
                        ),
                      ),
                    ],
                  )
              
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
