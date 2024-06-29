import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'track_visitor_widget.dart' show TrackVisitorWidget;
import 'package:flutter/material.dart';

class TrackVisitorModel extends FlutterFlowModel<TrackVisitorWidget> {
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
  // State field(s) for business-name widget.
  bool? businessNameValue;
  // State field(s) for visitor-name widget.
  bool? visitorNameValue;
  // State field(s) for visitor-emai widget.
  bool? visitorEmaiValue;
  // State field(s) for visitor-phone-numebr widget.
  bool? visitorPhoneNumebrValue;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }
}
