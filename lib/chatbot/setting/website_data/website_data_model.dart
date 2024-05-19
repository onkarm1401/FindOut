import '/flutter_flow/flutter_flow_util.dart';
import 'website_data_widget.dart' show WebsiteDataWidget;
import 'package:flutter/material.dart';

class WebsiteDataModel extends FlutterFlowModel<WebsiteDataWidget> {
  ///  Local state fields for this component.

  String? websiteData;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
