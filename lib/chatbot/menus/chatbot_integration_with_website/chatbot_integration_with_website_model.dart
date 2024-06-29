import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/chatbot/setting/website_data/website_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_integration_with_website_widget.dart'
    show ChatbotIntegrationWithWebsiteWidget;
import 'package:flutter/material.dart';

class ChatbotIntegrationWithWebsiteModel
    extends FlutterFlowModel<ChatbotIntegrationWithWebsiteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for websiteData component.
  late WebsiteDataModel websiteDataModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    websiteDataModel = createModel(context, () => WebsiteDataModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    websiteDataModel.dispose();
  }
}