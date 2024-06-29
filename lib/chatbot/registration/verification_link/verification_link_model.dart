import '/flutter_flow/flutter_flow_util.dart';
import 'verification_link_widget.dart' show VerificationLinkWidget;
import 'package:flutter/material.dart';

class VerificationLinkModel extends FlutterFlowModel<VerificationLinkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
