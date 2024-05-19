import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_asistent_widget.dart' show CreateAsistentWidget;
import 'package:flutter/material.dart';

class CreateAsistentModel extends FlutterFlowModel<CreateAsistentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (createAssistent)] action in Button widget.
  ApiCallResponse? createAssistentResponse;
  // Stores action output result for [Backend Call - API (createVectorStorage)] action in Button widget.
  ApiCallResponse? createVectorStorage;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? linkVectorStoreToAsistent;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
