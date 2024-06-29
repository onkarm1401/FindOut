import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Companyemail widget.
  FocusNode? companyemailFocusNode1;
  TextEditingController? companyemailTextController1;
  String? Function(BuildContext, String?)? companyemailTextController1Validator;
  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for Companyemail widget.
  FocusNode? companyemailFocusNode2;
  TextEditingController? companyemailTextController2;
  String? Function(BuildContext, String?)? companyemailTextController2Validator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    companyemailFocusNode1?.dispose();
    companyemailTextController1?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    companyemailFocusNode2?.dispose();
    companyemailTextController2?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
