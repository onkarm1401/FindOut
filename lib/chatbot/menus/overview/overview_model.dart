import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'overview_widget.dart' show OverviewWidget;
import 'package:flutter/material.dart';

class OverviewModel extends FlutterFlowModel<OverviewWidget> {
  ///  Local state fields for this page.

  int? setup = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in overview widget.
  ApiCallResponse? apiResultzxz;
  // Stores action output result for [Firestore Query - Query a collection] action in overview widget.
  List<ChatHistoryRecord>? apiResult5zs;
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
