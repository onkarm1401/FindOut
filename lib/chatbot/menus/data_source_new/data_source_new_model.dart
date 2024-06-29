import '/backend/api_requests/api_calls.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'data_source_new_widget.dart' show DataSourceNewWidget;
import 'package:flutter/material.dart';

class DataSourceNewModel extends FlutterFlowModel<DataSourceNewWidget> {
  ///  Local state fields for this page.

  String? faq;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in data-source-new widget.
  ApiCallResponse? getAsistent;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadFile)] action in Button widget.
  ApiCallResponse? apiResultj8t;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? apiResult0ou;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? apiResult8zm;
  // Stores action output result for [Custom Action - pdfGenerator] action in Button widget.
  FFUploadedFile? generatedPDF;
  // Stores action output result for [Backend Call - API (uploadFile)] action in Button widget.
  ApiCallResponse? apiResultcgi;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? apiResult6t8;
  // State field(s) for existingData widget.
  FocusNode? existingDataFocusNode;
  TextEditingController? existingDataTextController;
  String? Function(BuildContext, String?)? existingDataTextControllerValidator;
  // Stores action output result for [Backend Call - API (openAI)] action in Button widget.
  ApiCallResponse? apiResultabq;
  // Stores action output result for [Custom Action - pdfGenerator] action in Button widget.
  FFUploadedFile? generatedFAQPDF;
  // Stores action output result for [Backend Call - API (uploadFile)] action in Button widget.
  ApiCallResponse? apiResultcgiFAQ;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? apiResult6t8iFAQ;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    tabBarController?.dispose();
    existingDataFocusNode?.dispose();
    existingDataTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
