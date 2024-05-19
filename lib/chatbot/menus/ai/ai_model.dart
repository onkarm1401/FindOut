import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_widget.dart' show AiWidget;
import 'package:flutter/material.dart';

class AiModel extends FlutterFlowModel<AiWidget> {
  ///  Local state fields for this page.

  String? runId;

  String? status;

  List<String> logs = [];
  void addToLogs(String item) => logs.add(item);
  void removeFromLogs(String item) => logs.remove(item);
  void removeAtIndexFromLogs(int index) => logs.removeAt(index);
  void insertAtIndexInLogs(int index, String item) => logs.insert(index, item);
  void updateLogsAtIndex(int index, Function(String) updateFn) =>
      logs[index] = updateFn(logs[index]);

  bool chatbotVisiblity = true;

  String? threadId;

  List<ContentStruct> chatHistory = [];
  void addToChatHistory(ContentStruct item) => chatHistory.add(item);
  void removeFromChatHistory(ContentStruct item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, ContentStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(ContentStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  String? chatUniqueID;

  String? selectedExQue;

  String? reportProblem = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in AI widget.
  ChatHistoryRecord? chatRecord;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // Stores action output result for [Backend Call - API (createThread)] action in Button widget.
  ApiCallResponse? apiThreadResultCopy;
  // Stores action output result for [Backend Call - API (createMessage)] action in Button widget.
  ApiCallResponse? createMessageResponseCopy;
  // Stores action output result for [Backend Call - API (createRun)] action in Button widget.
  ApiCallResponse? createRunResponseCopy;
  // Stores action output result for [Backend Call - API (retriveRun)] action in Button widget.
  ApiCallResponse? runRetriveResponseCopy;
  // Stores action output result for [Backend Call - API (message)] action in Button widget.
  ApiCallResponse? aiResponseForMessageCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (createThread)] action in Button widget.
  ApiCallResponse? apiThreadResult;
  // Stores action output result for [Backend Call - API (createMessage)] action in Button widget.
  ApiCallResponse? createMessageResponse;
  // Stores action output result for [Backend Call - API (createRun)] action in Button widget.
  ApiCallResponse? createRunResponse;
  // Stores action output result for [Backend Call - API (retriveRun)] action in Button widget.
  ApiCallResponse? runRetriveResponse;
  // Stores action output result for [Backend Call - API (message)] action in Button widget.
  ApiCallResponse? aiResponseForMessage;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    rowController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewController?.dispose();
    rowController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    columnController?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }
}
