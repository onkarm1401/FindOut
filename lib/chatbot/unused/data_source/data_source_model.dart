import '/backend/api_requests/api_calls.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'data_source_widget.dart' show DataSourceWidget;
import 'package:flutter/material.dart';

class DataSourceModel extends FlutterFlowModel<DataSourceWidget> {
  ///  Local state fields for this page.

  int? uniqueLinksCount;

  List<String> uniqueURL = [];
  void addToUniqueURL(String item) => uniqueURL.add(item);
  void removeFromUniqueURL(String item) => uniqueURL.remove(item);
  void removeAtIndexFromUniqueURL(int index) => uniqueURL.removeAt(index);
  void insertAtIndexInUniqueURL(int index, String item) =>
      uniqueURL.insert(index, item);
  void updateUniqueURLAtIndex(int index, Function(String) updateFn) =>
      uniqueURL[index] = updateFn(uniqueURL[index]);

  int? totalIteration = 0;

  int? currentIteration = 0;

  List<String> fetchedInfo = [];
  void addToFetchedInfo(String item) => fetchedInfo.add(item);
  void removeFromFetchedInfo(String item) => fetchedInfo.remove(item);
  void removeAtIndexFromFetchedInfo(int index) => fetchedInfo.removeAt(index);
  void insertAtIndexInFetchedInfo(int index, String item) =>
      fetchedInfo.insert(index, item);
  void updateFetchedInfoAtIndex(int index, Function(String) updateFn) =>
      fetchedInfo[index] = updateFn(fetchedInfo[index]);

  String? faq;

  List<String> logs = [];
  void addToLogs(String item) => logs.add(item);
  void removeFromLogs(String item) => logs.remove(item);
  void removeAtIndexFromLogs(int index) => logs.removeAt(index);
  void insertAtIndexInLogs(int index, String item) => logs.insert(index, item);
  void updateLogsAtIndex(int index, Function(String) updateFn) =>
      logs[index] = updateFn(logs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in data-source widget.
  ApiCallResponse? apiResultwlo;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Button widget.
  ApiCallResponse? getAsistent;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? mFileGeneration;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? mLinkFIleToVectorStorage;
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in Button widget.
  ApiCallResponse? apiResultw;
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
  // State field(s) for existingData widget.
  FocusNode? existingDataFocusNode;
  TextEditingController? existingDataTextController;
  String? Function(BuildContext, String?)? existingDataTextControllerValidator;
  // Stores action output result for [Backend Call - API (openAI)] action in Button widget.
  ApiCallResponse? apiResultabq;
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
