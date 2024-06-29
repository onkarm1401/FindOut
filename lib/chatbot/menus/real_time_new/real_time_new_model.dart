import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'real_time_new_widget.dart' show RealTimeNewWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RealTimeNewModel extends FlutterFlowModel<RealTimeNewWidget> {
  ///  Local state fields for this page.

  String? runId;

  String? status;

  bool chatbotVisiblity = true;

  String? threadId;

  String? chatUniqueID;

  String? selectedExQue;

  String? reportProblem = '';

  String? instructions;

  bool? collectUserData;

  bool? report = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in real-time-new widget.
  ChatHistoryRecord? chatRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in real-time-new widget.
  UserTableRecord? user;
  // Stores action output result for [Backend Call - Create Document] action in real-time-new widget.
  MessagesRecord? firstMessage;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  List<MessagesRecord>? listViewPreviousSnapshot;
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Button widget.
  ApiCallResponse? getAsistentCopy;
  // Stores action output result for [Backend Call - API (createThread)] action in Button widget.
  ApiCallResponse? apiThreadResultCopy;
  // Stores action output result for [Backend Call - API (createMessage)] action in Button widget.
  ApiCallResponse? createMessageResponseCopy;
  AudioPlayer? soundPlayer1;
  // Stores action output result for [Backend Call - API (createRun)] action in Button widget.
  ApiCallResponse? createRunResponseCopy;
  // Stores action output result for [Backend Call - API (retriveRun)] action in Button widget.
  ApiCallResponse? runRetriveResponseCopy;
  // Stores action output result for [Backend Call - API (message)] action in Button widget.
  ApiCallResponse? aiResponseForMessageCopy;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatHistoryRecord? chatHistoryButton;
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Button widget.
  ApiCallResponse? getAsistentDetails;
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in Button widget.
  ApiCallResponse? getFileID;
  // Stores action output result for [Backend Call - API (createThread)] action in Button widget.
  ApiCallResponse? apiThreadResult;
  // Stores action output result for [Backend Call - API (createMessage)] action in Button widget.
  ApiCallResponse? createMessageResponse;
  AudioPlayer? soundPlayer4;
  // Stores action output result for [Backend Call - API (createRun)] action in Button widget.
  ApiCallResponse? createRunResponse;
  // Stores action output result for [Backend Call - API (retriveRun)] action in Button widget.
  ApiCallResponse? runRetriveResponse;
  // Stores action output result for [Backend Call - API (message)] action in Button widget.
  ApiCallResponse? aiResponseForMessage;
  AudioPlayer? soundPlayer5;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for busines-name widget.
  FocusNode? businesNameFocusNode;
  TextEditingController? businesNameTextController;
  String? Function(BuildContext, String?)? businesNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for Column widget.
  ScrollController? columnController2;
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
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    rowController = ScrollController();
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewController?.dispose();
    rowController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    columnController1?.dispose();
    businesNameFocusNode?.dispose();
    businesNameTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    columnController2?.dispose();
    reportedUsernameFocusNode?.dispose();
    reportedUsernameTextController?.dispose();

    reportedEmailFocusNode?.dispose();
    reportedEmailTextController?.dispose();

    reportedPhoennumberFocusNode?.dispose();
    reportedPhoennumberTextController?.dispose();

    textFieldFocusNode5?.dispose();
    textController9?.dispose();
  }
}
