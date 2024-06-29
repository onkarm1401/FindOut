import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'live_chat_widget.dart' show LiveChatWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LiveChatModel extends FlutterFlowModel<LiveChatWidget> {
  ///  Local state fields for this page.

  String? selectedChat;

  String? name;

  bool? stared;

  DateTime? dateEnd;

  bool? star;

  int? messageCount;

  String? threadID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // Stores action output result for [Backend Call - API (deleteThread)] action in IconButton widget.
  ApiCallResponse? apiResultqes;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MessagesRecord>? deleteMessages;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  MessagesRecord? fetchedMessage;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MessagesRecord>? fetchMessageCollections;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  List<MessagesRecord>? listViewPreviousSnapshot;
  AudioPlayer? soundPlayer;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
