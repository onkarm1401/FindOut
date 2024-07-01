import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_chatbot_widget.dart' show TestChatbotWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in test-chatbot widget.
  ApiCallResponse? getAsistent;
  // Stores action output result for [Backend Call - API (createThread)] action in test-chatbot widget.
  ApiCallResponse? apiThreadResult;
  AudioPlayer? soundPlayer1;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - API (deleteThread)] action in sideNav widget.
  ApiCallResponse? apiResulttfx;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (createMessage)] action in Button widget.
  ApiCallResponse? createMessageResponse;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - API (createRun)] action in Button widget.
  ApiCallResponse? createRunResponse;
  // Stores action output result for [Backend Call - API (retriveRun)] action in Button widget.
  ApiCallResponse? runRetriveResponse;
  // Stores action output result for [Backend Call - API (message)] action in Button widget.
  ApiCallResponse? aiResponseForMessage;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
