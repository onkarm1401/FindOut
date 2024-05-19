import '/backend/api_requests/api_calls.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
  ///  Local state fields for this page.

  String? faq;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Button widget.
  ApiCallResponse? getAsistnetINFO;
  // Stores action output result for [Backend Call - API (deleteStorageFile)] action in Button widget.
  ApiCallResponse? mDeleteUploadedFile;
  // Stores action output result for [Backend Call - API (deleteVectorStorage)] action in Button widget.
  ApiCallResponse? mDeleteVectorStore;
  // Stores action output result for [Backend Call - API (createVectorStorage)] action in Button widget.
  ApiCallResponse? mCreateVectorStore;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? mFileGeneration;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? mLinkFileToVectorStore;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? mLinkVectorToAsistent;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? failGeneratedFile;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? fGeneratedFile;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? fLinkFileToVector;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? fLinkVectorToAsistent;
  // Stores action output result for [Backend Call - API (openAI)] action in Button widget.
  ApiCallResponse? apiResultabq;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
