import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'enable_user_to_report_problem_widget.dart'
    show EnableUserToReportProblemWidget;
import 'package:flutter/material.dart';

class EnableUserToReportProblemModel
    extends FlutterFlowModel<EnableUserToReportProblemWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for reported_username widget.
  FocusNode? reportedUsernameFocusNode;
  TextEditingController? reportedUsernameTextController;
  String? Function(BuildContext, String?)?
      reportedUsernameTextControllerValidator;
  // State field(s) for reported-email widget.
  FocusNode? reportedEmailFocusNode;
  TextEditingController? reportedEmailTextController;
  String? Function(BuildContext, String?)? reportedEmailTextControllerValidator;
  // State field(s) for reported-phoennumber widget.
  FocusNode? reportedPhoennumberFocusNode;
  TextEditingController? reportedPhoennumberTextController;
  String? Function(BuildContext, String?)?
      reportedPhoennumberTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    reportedUsernameFocusNode?.dispose();
    reportedUsernameTextController?.dispose();

    reportedEmailFocusNode?.dispose();
    reportedEmailTextController?.dispose();

    reportedPhoennumberFocusNode?.dispose();
    reportedPhoennumberTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }
}
