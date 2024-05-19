import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_chatbot_widget.dart' show TestChatbotWidget;
import 'package:flutter/material.dart';

class TestChatbotModel extends FlutterFlowModel<TestChatbotWidget> {
  ///  Local state fields for this page.

  List<ContentStruct> chatHistory = [];
  void addToChatHistory(ContentStruct item) => chatHistory.add(item);
  void removeFromChatHistory(ContentStruct item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, ContentStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(ContentStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  String? threadId = '';

  String? runId = '';

  String? status = '';

  List<String> logs = [];
  void addToLogs(String item) => logs.add(item);
  void removeFromLogs(String item) => logs.remove(item);
  void removeAtIndexFromLogs(int index) => logs.removeAt(index);
  void insertAtIndexInLogs(int index, String item) => logs.insert(index, item);
  void updateLogsAtIndex(int index, Function(String) updateFn) =>
      logs[index] = updateFn(logs[index]);

  bool chatbotVisiblity = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (createThread)] action in testChatbot widget.
  ApiCallResponse? apiThreadResult;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (createMessage)] action in Button widget.
  ApiCallResponse? createMessageResponse;
  // Stores action output result for [Backend Call - API (createRun)] action in Button widget.
  ApiCallResponse? createRunResponse;
  // Stores action output result for [Backend Call - API (retriveRun)] action in Button widget.
  ApiCallResponse? runRetriveResponse;
  // Stores action output result for [Backend Call - API (message)] action in Button widget.
  ApiCallResponse? aiResponseForMessage;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    listViewController1?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewController2?.dispose();
  }
}
