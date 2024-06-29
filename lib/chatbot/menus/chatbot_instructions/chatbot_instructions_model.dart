import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'chatbot_instructions_widget.dart' show ChatbotInstructionsWidget;
import 'package:flutter/material.dart';

class ChatbotInstructionsModel
    extends FlutterFlowModel<ChatbotInstructionsWidget> {
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

  dynamic instruction;

  String? optimizedData;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Chatbot-Instructions widget.
  ApiCallResponse? apiResultf03;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - API (openAI)] action in Button widget.
  ApiCallResponse? apiResultkx1;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? updateAsistent;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for supportEmailID widget.
  FocusNode? supportEmailIDFocusNode;
  TextEditingController? supportEmailIDTextController;
  String? Function(BuildContext, String?)?
      supportEmailIDTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for instruction widget.
  FocusNode? instructionFocusNode;
  TextEditingController? instructionTextController;
  String? Function(BuildContext, String?)? instructionTextControllerValidator;
  // State field(s) for question2 widget.
  FocusNode? question2FocusNode;
  TextEditingController? question2TextController;
  String? Function(BuildContext, String?)? question2TextControllerValidator;
  // State field(s) for question1 widget.
  FocusNode? question1FocusNode;
  TextEditingController? question1TextController;
  String? Function(BuildContext, String?)? question1TextControllerValidator;
  // State field(s) for question3 widget.
  FocusNode? question3FocusNode;
  TextEditingController? question3TextController;
  String? Function(BuildContext, String?)? question3TextControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    supportEmailIDFocusNode?.dispose();
    supportEmailIDTextController?.dispose();

    instructionFocusNode?.dispose();
    instructionTextController?.dispose();

    question2FocusNode?.dispose();
    question2TextController?.dispose();

    question1FocusNode?.dispose();
    question1TextController?.dispose();

    question3FocusNode?.dispose();
    question3TextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
}
