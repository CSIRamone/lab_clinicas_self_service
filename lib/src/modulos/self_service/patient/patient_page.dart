import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modulos/self_service/widget/lab_clinicas_sef_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> with PatientFormController, MessagesViewMixin{

  final selfServiceController = Injector.get<SelfServiceController>();
  final PatientController controller = Injector.get<PatientController>();

  final formKey = GlobalKey<FormState>();

  late bool patientFound;
  late bool enableForm;

  @override
  void initState() {

    messagesListener(controller);
    final SelfServiceModel(:patient) = selfServiceController.model;
    patientFound = patient != null;
    enableForm = !patientFound;
    initializeForm(patient);
    effect((){
      if(controller.nextStep.value){
        selfServiceController.updatePatientAndGoDocument(controller.patient);
      }
    });


    super.initState();
  }

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
                  Visibility(
                    visible: patientFound,
                    replacement: Image.asset('assets/images/lupa_icon.png'),
                    child: Image.asset('assets/images/check_icon.png'),
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: patientFound,
                    replacement: const Text(
                      'Cadastro não encontrado',
                      style: LabClinicasTheme.titleSmallStyle,
                    ),
                    child: const Text(
                      'Cadastro encontrado',
                      style: LabClinicasTheme.titleSmallStyle,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Visibility(
                    visible: patientFound,
                    replacement: const Text(
                      'Preencha o formulário abaixo para fazer o seu cadastro',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: LabClinicasTheme.blueColor,
                      ),
                    ),
                    child: const Text(
                      'Confirma os dados do seu cadastro',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: LabClinicasTheme.blueColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                    decoration: const InputDecoration(
                      label: Text('Nome Paciente'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email obrigatório'),
                      Validatorless.email('Email inválido'),
                    ]),
                    controller: emailEC,
                    decoration: const InputDecoration(label: Text('Email')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
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
                    readOnly: !enableForm,
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
                    readOnly: !enableForm,
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
                          readOnly: !enableForm,
                          validator: Validatorless.required(
                            'Endereço Obrigatório',
                          ),
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
                          readOnly: !enableForm,
                          validator: Validatorless.required(
                            'Número Obrigatório',
                          ),
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
                          readOnly: !enableForm,
                          controller: complementEC,
                          decoration: const InputDecoration(
                            label: Text('Complemento'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator: Validatorless.required(
                            'Estado Obrigatório',
                          ),
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
                          readOnly: !enableForm,
                          validator: Validatorless.required(
                            'Cidade Obrigatória',
                          ),
                          controller: cityEC,
                          decoration: const InputDecoration(
                            label: Text('Cidade'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator: Validatorless.required(
                            'Bairro Obrigatório',
                          ),
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
                    readOnly: !enableForm,
                    controller: guardianEC,
                    decoration: const InputDecoration(
                      label: Text('Responsável'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
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
                  Visibility(
                    visible: !enableForm,
                    replacement: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid = formKey.currentState?.validate() ?? false;
                          if(valid){
                            controller.updateAndNext(updatePatient(selfServiceController.model.patient!));
                          }
                        },
                        child: Visibility(
                          visible: !patientFound,
                          replacement: const Text('Salvar e Continuar'),
                          child: const Text('Cadastrar')),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  enableForm = true;
                                });
                              },
                              child: const Text('Editar'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.patient = selfServiceController.model.patient;
                                controller.goNextStep();
                              },
                              child: const Text('Continuar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
