import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'design_u_i_widget.dart' show DesignUIWidget;
import 'package:flutter/material.dart';

class DesignUIModel extends FlutterFlowModel<DesignUIWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  Color? colorPicked1;
  Color? colorPicked2;
  Color? colorPicked3;
  Color? colorPicked4;
  Color? colorPicked5;
  Color? colorPicked6;
  Color? colorPicked7;
  Color? colorPicked8;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for ChatbotTitle widget.
  FocusNode? chatbotTitleFocusNode;
  TextEditingController? chatbotTitleTextController;
  String? Function(BuildContext, String?)? chatbotTitleTextControllerValidator;
  // State field(s) for ChatbotSub-Title widget.
  FocusNode? chatbotSubTitleFocusNode;
  TextEditingController? chatbotSubTitleTextController;
  String? Function(BuildContext, String?)?
      chatbotSubTitleTextControllerValidator;
  // State field(s) for Placeholder widget.
  FocusNode? placeholderFocusNode;
  TextEditingController? placeholderTextController;
  String? Function(BuildContext, String?)? placeholderTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;

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

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    chatbotTitleFocusNode?.dispose();
    chatbotTitleTextController?.dispose();

    chatbotSubTitleFocusNode?.dispose();
    chatbotSubTitleTextController?.dispose();

    placeholderFocusNode?.dispose();
    placeholderTextController?.dispose();

    textFieldFocusNode5?.dispose();
    textController8?.dispose();
  }
}
