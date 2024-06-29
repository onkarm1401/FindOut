import '/flutter_flow/flutter_flow_util.dart';
import 'reset_password_link_widget.dart' show ResetPasswordLinkWidget;
import 'package:flutter/material.dart';

class ResetPasswordLinkModel extends FlutterFlowModel<ResetPasswordLinkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
