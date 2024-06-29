import '/flutter_flow/flutter_flow_util.dart';
import 'new_registration_widget.dart' show NewRegistrationWidget;
import 'package:flutter/material.dart';

class NewRegistrationModel extends FlutterFlowModel<NewRegistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for company_email widget.
  FocusNode? companyEmailFocusNode;
  TextEditingController? companyEmailTextController;
  String? Function(BuildContext, String?)? companyEmailTextControllerValidator;
  // State field(s) for reason_for_aaccount widget.
  FocusNode? reasonForAaccountFocusNode;
  TextEditingController? reasonForAaccountTextController;
  String? Function(BuildContext, String?)?
      reasonForAaccountTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirm_password widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    companyEmailFocusNode?.dispose();
    companyEmailTextController?.dispose();

    reasonForAaccountFocusNode?.dispose();
    reasonForAaccountTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
