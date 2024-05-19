import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_history_widget.dart' show ChatHistoryWidget;
import 'package:flutter/material.dart';

class ChatHistoryModel extends FlutterFlowModel<ChatHistoryWidget> {
  ///  Local state fields for this page.

  List<String> selectedrow = [];
  void addToSelectedrow(String item) => selectedrow.add(item);
  void removeFromSelectedrow(String item) => selectedrow.remove(item);
  void removeAtIndexFromSelectedrow(int index) => selectedrow.removeAt(index);
  void insertAtIndexInSelectedrow(int index, String item) =>
      selectedrow.insert(index, item);
  void updateSelectedrowAtIndex(int index, Function(String) updateFn) =>
      selectedrow[index] = updateFn(selectedrow[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;

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
