import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'real_time_new_model.dart';
export 'real_time_new_model.dart';

class RealTimeNewWidget extends StatefulWidget {
  const RealTimeNewWidget({
    super.key,
    required this.id,
  });

  final DocumentReference? id;

  @override
  State<RealTimeNewWidget> createState() => _RealTimeNewWidgetState();
}

class _RealTimeNewWidgetState extends State<RealTimeNewWidget>
    with TickerProviderStateMixin {
  late RealTimeNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RealTimeNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatUniqueID = '${random_data.randomString(
        10,
        40,
        true,
        true,
        true,
      )}${getCurrentTimestamp.microsecondsSinceEpoch.toString()}${random_data.randomInteger(1000, 10000).toString()}';
      _model.collectUserData =
          valueOrDefault<bool>(currentUserDocument?.collectUserData, false);
      setState(() {});

      var chatHistoryRecordReference = ChatHistoryRecord.collection.doc();
      await chatHistoryRecordReference.set(createChatHistoryRecordData(
        userID: widget.id?.id,
        chatDate: getCurrentTimestamp,
        chatUniqueId: _model.chatUniqueID,
        chatFeedback: 0,
        expertJoined: false,
      ));
      _model.chatRecord = ChatHistoryRecord.getDocumentFromData(
          createChatHistoryRecordData(
            userID: widget.id?.id,
            chatDate: getCurrentTimestamp,
            chatUniqueId: _model.chatUniqueID,
            chatFeedback: 0,
            expertJoined: false,
          ),
          chatHistoryRecordReference);
      _model.user = await queryUserTableRecordOnce(
        queryBuilder: (userTableRecord) => userTableRecord.where(
          'uid',
          isEqualTo: widget.id?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      var messagesRecordReference = MessagesRecord.collection.doc();
      await messagesRecordReference.set(createMessagesRecordData(
        timestamp: getCurrentTimestamp,
        userID: widget.id?.id,
        uniqueID: _model.chatUniqueID,
        sender: 'AI',
        messageContent: _model.user?.welcomeMessageForVisitor,
      ));
      _model.firstMessage = MessagesRecord.getDocumentFromData(
          createMessagesRecordData(
            timestamp: getCurrentTimestamp,
            userID: widget.id?.id,
            uniqueID: _model.chatUniqueID,
            sender: 'AI',
            messageContent: _model.user?.welcomeMessageForVisitor,
          ),
          messagesRecordReference);
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.businesNameTextController ??= TextEditingController();
    _model.businesNameFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.reportedUsernameTextController ??= TextEditingController();
    _model.reportedUsernameFocusNode ??= FocusNode();

    _model.reportedEmailTextController ??= TextEditingController();
    _model.reportedEmailFocusNode ??= FocusNode();

    _model.reportedPhoennumberTextController ??= TextEditingController();
    _model.reportedPhoennumberFocusNode ??= FocusNode();

    _model.textController9 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserTableRecord>(
      stream: UserTableRecord.getDocument(widget.id!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final realTimeNewUserTableRecord = snapshot.data!;
        return Title(
            title: 'real-time-new',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                body: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        constraints: const BoxConstraints(
                          minHeight: 75.0,
                        ),
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            realTimeNewUserTableRecord.colorChatbotHeader,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Container(
                                  width: 48.0,
                                  height: 48.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl:
                                        realTimeNewUserTableRecord.chatbotLogo,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, error, stackTrace) =>
                                        Image.asset(
                                      'assets/images/error_image.webp',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        realTimeNewUserTableRecord.chatbotName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: valueOrDefault<Color>(
                                                realTimeNewUserTableRecord
                                                    .colorHeaderTextColor,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      AutoSizeText(
                                        realTimeNewUserTableRecord
                                            .chatbotDescripation,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: valueOrDefault<Color>(
                                                realTimeNewUserTableRecord
                                                    .colorHeaderTextColor,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(
                                        'real-time-new',
                                        queryParameters: {
                                          'id': serializeParam(
                                            widget.id,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.replay,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_model.chatRecord?.expertJoined == false)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 12.0, 4.0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.04,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).success,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.dotCircle,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 14.0,
                                  ),
                                  Text(
                                    'Executive Joined',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.84,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: StreamBuilder<
                                              List<MessagesRecord>>(
                                            stream: queryMessagesRecord(
                                              queryBuilder: (messagesRecord) =>
                                                  messagesRecord
                                                      .where(
                                                        'userID',
                                                        isEqualTo:
                                                            widget.id?.id,
                                                      )
                                                      .where(
                                                        'uniqueID',
                                                        isEqualTo:
                                                            _model.chatUniqueID,
                                                      )
                                                      .orderBy('timestamp'),
                                            )..listen((snapshot) {
                                                List<MessagesRecord>
                                                    listViewMessagesRecordList =
                                                    snapshot;
                                                if (_model.listViewPreviousSnapshot !=
                                                        null &&
                                                    !const ListEquality(
                                                            MessagesRecordDocumentEquality())
                                                        .equals(
                                                            listViewMessagesRecordList,
                                                            _model
                                                                .listViewPreviousSnapshot)) {
                                                  () async {
                                                    await _model
                                                        .listViewController
                                                        ?.animateTo(
                                                      _model
                                                          .listViewController!
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );

                                                    setState(() {});
                                                  }();
                                                }
                                                _model.listViewPreviousSnapshot =
                                                    snapshot;
                                              }),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 112.0,
                                                    height: 112.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MessagesRecord>
                                                  listViewMessagesRecordList =
                                                  snapshot.data!;
                                              return ListView.separated(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 12.0),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewMessagesRecordList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 12.0),
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewMessagesRecord =
                                                      listViewMessagesRecordList[
                                                          listViewIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (listViewMessagesRecord
                                                              .sender ==
                                                          'AI')
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      realTimeNewUserTableRecord
                                                                          .chatbotLogo,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.webp',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        minHeight:
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.06,
                                                                        maxWidth:
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.75,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          realTimeNewUserTableRecord
                                                                              .colorChatbotMessageBackground,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(valueOrDefault<double>(
                                                                            realTimeNewUserTableRecord.messageBroderRadius4.toDouble(),
                                                                            0.0,
                                                                          )),
                                                                          bottomRight:
                                                                              Radius.circular(valueOrDefault<double>(
                                                                            realTimeNewUserTableRecord.messageBroderRadius3.toDouble(),
                                                                            0.0,
                                                                          )),
                                                                          topLeft:
                                                                              Radius.circular(valueOrDefault<double>(
                                                                            realTimeNewUserTableRecord.messageBroderRadius2.toDouble(),
                                                                            0.0,
                                                                          )),
                                                                          topRight:
                                                                              Radius.circular(valueOrDefault<double>(
                                                                            realTimeNewUserTableRecord.messageBroderRadius1.toDouble(),
                                                                            0.0,
                                                                          )),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              14.0,
                                                                              8.0,
                                                                              14.0,
                                                                              8.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            listViewMessagesRecord.sender == 'AI'
                                                                                ? listViewMessagesRecord.messageContent
                                                                                : 'NA',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: valueOrDefault<Color>(
                                                                                    realTimeNewUserTableRecord.colorChatbotMessageText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderRadius:
                                                                              14.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              24.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.thumb_up,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              _model.chatRecord?.chatFeedback == 1 ? realTimeNewUserTableRecord.colorChatbotHeader : FlutterFlowTheme.of(context).secondaryText,
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await _model.chatRecord!.reference.update(createChatHistoryRecordData(
                                                                              chatFeedback: 1,
                                                                            ));
                                                                          },
                                                                        ),
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              14.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              24.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.thumb_down_alt,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              _model.chatRecord?.chatFeedback == 2 ? realTimeNewUserTableRecord.colorChatbotHeader : FlutterFlowTheme.of(context).secondaryText,
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await _model.chatRecord!.reference.update(createChatHistoryRecordData(
                                                                              chatFeedback: 2,
                                                                            ));
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (listViewIndex ==
                                                                      0)
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final suggestedQuestions = (_model.user?.expectedQuestions.toList() ?? [])
                                                                              .take(5)
                                                                              .toList();
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                List.generate(suggestedQuestions.length, (suggestedQuestionsIndex) {
                                                                              final suggestedQuestionsItem = suggestedQuestions[suggestedQuestionsIndex];
                                                                              return Visibility(
                                                                                visible: suggestedQuestionsItem != '',
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    var shouldSetState = false;
                                                                                    if (_model.threadId == null || _model.threadId == '' ? true : false) {
                                                                                      _model.getAsistentCopy = await OpenAIAssistentGroup.getAssistentDetailsCall.call(
                                                                                        assistentId: realTimeNewUserTableRecord.openAIAssistentId,
                                                                                        token: getRemoteConfigString('openAI_key'),
                                                                                      );

                                                                                      shouldSetState = true;
                                                                                      _model.apiThreadResultCopy = await OpenAIAssistentGroup.createThreadCall.call(
                                                                                        token: getRemoteConfigString('openAI_key'),
                                                                                        vectorStoreIds: OpenAIAssistentGroup.getAssistentDetailsCall
                                                                                            .vectorstoreids(
                                                                                              (_model.getAsistentCopy?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.first,
                                                                                        instructions: OpenAIAssistentGroup.getAssistentDetailsCall.instructions(
                                                                                          (_model.getAsistentCopy?.jsonBody ?? ''),
                                                                                        ),
                                                                                      );

                                                                                      shouldSetState = true;
                                                                                      if ((_model.apiThreadResultCopy?.succeeded ?? true)) {
                                                                                        _model.threadId = OpenAIAssistentGroup.createThreadCall.threadId(
                                                                                          (_model.apiThreadResultCopy?.jsonBody ?? ''),
                                                                                        );
                                                                                        _model.instructions = OpenAIAssistentGroup.getAssistentDetailsCall.instructions(
                                                                                          (_model.getAsistentCopy?.jsonBody ?? ''),
                                                                                        );
                                                                                        setState(() {});

                                                                                        await currentUserReference!.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'visitor_count': FieldValue.increment(1),
                                                                                              'messages_count': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });

                                                                                        await _model.chatRecord!.reference.update(createChatHistoryRecordData(
                                                                                          threadId: _model.threadId,
                                                                                        ));

                                                                                        await _model.firstMessage!.reference.update(createMessagesRecordData(
                                                                                          threadId: _model.threadId,
                                                                                        ));
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Failed to start communication. Please contact support team',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );

                                                                                        await realTimeNewUserTableRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'logs': FieldValue.arrayUnion([
                                                                                                '${getCurrentTimestamp.toString()}-Failed to create thread in predifined question - ${(_model.apiThreadResultCopy?.jsonBody ?? '').toString()}'
                                                                                              ]),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        if (shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      await realTimeNewUserTableRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'logs': FieldValue.arrayUnion([
                                                                                              '${getCurrentTimestamp.toString()}-Failed to start predefined question - '
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                    }

                                                                                    _model.createMessageResponseCopy = await OpenAIAssistentGroup.createMessageCall.call(
                                                                                      threadId: _model.threadId,
                                                                                      token: getRemoteConfigString('openAI_key'),
                                                                                      content: suggestedQuestionsItem,
                                                                                    );

                                                                                    shouldSetState = true;
                                                                                    if ((_model.createMessageResponseCopy?.succeeded ?? true)) {
                                                                                      unawaited(
                                                                                        () async {
                                                                                          await MessagesRecord.collection.doc().set(createMessagesRecordData(
                                                                                                timestamp: getCurrentTimestamp,
                                                                                                userID: widget.id?.id,
                                                                                                uniqueID: _model.chatUniqueID,
                                                                                                sender: 'USER',
                                                                                                messageContent: suggestedQuestionsItem,
                                                                                                threadId: _model.threadId,
                                                                                              ));
                                                                                        }(),
                                                                                      );
                                                                                      _model.soundPlayer1 ??= AudioPlayer();
                                                                                      if (_model.soundPlayer1!.playing) {
                                                                                        await _model.soundPlayer1!.stop();
                                                                                      }
                                                                                      _model.soundPlayer1!.setVolume(1.0);
                                                                                      _model.soundPlayer1!.setAsset('assets/audios/notification_sound.mp3').then((_) => _model.soundPlayer1!.play());

                                                                                      setState(() {});
                                                                                      setState(() {
                                                                                        _model.textController1?.clear();
                                                                                      });
                                                                                      await Future.delayed(const Duration(milliseconds: 500));
                                                                                      _model.createRunResponseCopy = await OpenAIAssistentGroup.createRunCall.call(
                                                                                        threadId: _model.threadId,
                                                                                        assistantId: realTimeNewUserTableRecord.openAIAssistentId,
                                                                                        token: getRemoteConfigString('openAI_key'),
                                                                                        instructions: _model.instructions,
                                                                                        maxCompletionTokens: realTimeNewUserTableRecord.maximumTokenToUseForBotAnswer,
                                                                                      );

                                                                                      shouldSetState = true;
                                                                                      if ((_model.createRunResponseCopy?.succeeded ?? true)) {
                                                                                        _model.runId = OpenAIAssistentGroup.createRunCall.runId(
                                                                                          (_model.createRunResponseCopy?.jsonBody ?? ''),
                                                                                        );
                                                                                        setState(() {});
                                                                                        while (_model.status != 'completed') {
                                                                                          _model.runRetriveResponseCopy = await OpenAIAssistentGroup.retriveRunCall.call(
                                                                                            threadId: _model.threadId,
                                                                                            runId: _model.runId,
                                                                                            token: getRemoteConfigString('openAI_key'),
                                                                                          );

                                                                                          shouldSetState = true;
                                                                                          if ((_model.runRetriveResponseCopy?.succeeded ?? true)) {
                                                                                            _model.status = OpenAIAssistentGroup.retriveRunCall.status(
                                                                                              (_model.runRetriveResponseCopy?.jsonBody ?? ''),
                                                                                            );
                                                                                            setState(() {});
                                                                                            if (_model.status != 'completed') {
                                                                                              await Future.delayed(const Duration(milliseconds: 500));
                                                                                            }
                                                                                          } else {
                                                                                            await realTimeNewUserTableRecord.reference.update({
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'logs': FieldValue.arrayUnion([
                                                                                                    '${getCurrentTimestamp.toString()}-Failed to retrive run in predifined question - ${(_model.runRetriveResponseCopy?.jsonBody ?? '').toString()}'
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          }
                                                                                        }
                                                                                        _model.aiResponseForMessageCopy = await OpenAIAssistentGroup.messageCall.call(
                                                                                          threadId: _model.threadId,
                                                                                          token: getRemoteConfigString('openAI_key'),
                                                                                        );

                                                                                        shouldSetState = true;
                                                                                        if ((_model.aiResponseForMessageCopy?.succeeded ?? true)) {
                                                                                          await Future.delayed(const Duration(milliseconds: 500));
                                                                                          _model.status = null;
                                                                                          setState(() {});
                                                                                          unawaited(
                                                                                            () async {
                                                                                              await _model.chatRecord!.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'used_token': FieldValue.increment(OpenAIAssistentGroup.retriveRunCall.totalToken(
                                                                                                      (_model.runRetriveResponseCopy?.jsonBody ?? ''),
                                                                                                    )!),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            }(),
                                                                                          );
                                                                                          unawaited(
                                                                                            () async {
                                                                                              await currentUserReference!.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'used_token': FieldValue.increment(OpenAIAssistentGroup.retriveRunCall.totalToken(
                                                                                                      (_model.runRetriveResponseCopy?.jsonBody ?? ''),
                                                                                                    )!),
                                                                                                    'messages_count': FieldValue.increment(1),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            }(),
                                                                                          );

                                                                                          await MessagesRecord.collection.doc().set(createMessagesRecordData(
                                                                                                timestamp: getCurrentTimestamp,
                                                                                                userID: widget.id?.id,
                                                                                                uniqueID: _model.chatUniqueID,
                                                                                                sender: 'AI',
                                                                                                messageContent: OpenAIAssistentGroup.messageCall.responseText(
                                                                                                  (_model.aiResponseForMessageCopy?.jsonBody ?? ''),
                                                                                                ),
                                                                                                threadId: _model.threadId,
                                                                                              ));
                                                                                          _model.soundPlayer2 ??= AudioPlayer();
                                                                                          if (_model.soundPlayer2!.playing) {
                                                                                            await _model.soundPlayer2!.stop();
                                                                                          }
                                                                                          _model.soundPlayer2!.setVolume(1.0);
                                                                                          _model.soundPlayer2!.setAsset('assets/audios/notification_sound.mp3').then((_) => _model.soundPlayer2!.play());

                                                                                          _model.soundPlayer3 ??= AudioPlayer();
                                                                                          if (_model.soundPlayer3!.playing) {
                                                                                            await _model.soundPlayer3!.stop();
                                                                                          }
                                                                                          _model.soundPlayer3!.setVolume(1.0);
                                                                                          _model.soundPlayer3!.setAsset('assets/audios/notification_sound.mp3').then((_) => _model.soundPlayer3!.play());
                                                                                        } else {
                                                                                          await realTimeNewUserTableRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'logs': FieldValue.arrayUnion([
                                                                                                  '${getCurrentTimestamp.toString()}-Failed to Retrieve Message  in predifined question - ${(_model.aiResponseForMessageCopy?.jsonBody ?? '').toString()}'
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                        }
                                                                                      } else {
                                                                                        await realTimeNewUserTableRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'logs': FieldValue.arrayUnion([
                                                                                                '${getCurrentTimestamp.toString()}-Failed to create RUN in predifined question - ${(_model.createRunResponseCopy?.jsonBody ?? '').toString()}'
                                                                                              ]),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      }
                                                                                    } else {
                                                                                      await realTimeNewUserTableRecord.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'logs': FieldValue.arrayUnion([
                                                                                              '${getCurrentTimestamp.toString()}-Failed to create Message in predifined question - ${(_model.createMessageResponseCopy?.jsonBody ?? '').toString()}'
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                    }

                                                                                    if (shouldSetState) setState(() {});
                                                                                  },
                                                                                  text: suggestedQuestionsItem,
                                                                                  options: FFButtonOptions(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.05,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(24.0),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }).divide(
                                                                              const SizedBox(height: 6.0),
                                                                              filterFn: (suggestedQuestionsIndex) {
                                                                                final suggestedQuestionsItem = suggestedQuestions[suggestedQuestionsIndex];
                                                                                return suggestedQuestionsItem != '';
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      if (listViewMessagesRecord
                                                              .sender ==
                                                          'USER')
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        390),
                                                                curve: Curves
                                                                    .linear,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minHeight:
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.06,
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.75,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    realTimeNewUserTableRecord
                                                                        .colorUserMessageBackground,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            valueOrDefault<double>(
                                                                      realTimeNewUserTableRecord
                                                                          .messageBroderRadius3
                                                                          .toDouble(),
                                                                      0.0,
                                                                    )),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            valueOrDefault<double>(
                                                                      realTimeNewUserTableRecord
                                                                          .messageBroderRadius4
                                                                          .toDouble(),
                                                                      0.0,
                                                                    )),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                      realTimeNewUserTableRecord
                                                                          .messageBroderRadius1
                                                                          .toDouble(),
                                                                      0.0,
                                                                    )),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                      realTimeNewUserTableRecord
                                                                          .messageBroderRadius2
                                                                          .toDouble(),
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            14.0,
                                                                            8.0,
                                                                            14.0,
                                                                            8.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      listViewMessagesRecord.sender ==
                                                                              'USER'
                                                                          ? listViewMessagesRecord
                                                                              .messageContent
                                                                          : 'NA',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              realTimeNewUserTableRecord.colorUserMessageText,
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      realTimeNewUserTableRecord
                                                                          .userLogo,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.webp',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                    ],
                                                  );
                                                },
                                                controller:
                                                    _model.listViewController,
                                              ).animateOnPageLoad(animationsMap[
                                                  'listViewOnPageLoadAnimation']!);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 12.0, 14.0, 8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller: _model.rowController,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (realTimeNewUserTableRecord
                                                      .collectUserReportProblem ==
                                                  true)
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    _model.report = false;
                                                    setState(() {});
                                                  },
                                                  text: 'Report Problem',
                                                  options: FFButtonOptions(
                                                    height: 30.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 10.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode1,
                                                      autofocus: true,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            valueOrDefault<
                                                                String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.chatbotTextBoxPlaceholder,
                                                              ''),
                                                          'Ask something ...',
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              realTimeNewUserTableRecord
                                                                  .colorSendButtonBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      maxLines: null,
                                                      validator: _model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var shouldSetState = false;
                                                  _model.chatHistoryButton =
                                                      await queryChatHistoryRecordOnce(
                                                    queryBuilder:
                                                        (chatHistoryRecord) =>
                                                            chatHistoryRecord
                                                                .where(
                                                      'chatUniqueId',
                                                      isEqualTo:
                                                          _model.chatUniqueID,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  shouldSetState = true;
                                                  if (_model.chatHistoryButton
                                                          ?.expertJoined ==
                                                      false) {
                                                    if (_model.threadId ==
                                                                null ||
                                                            _model.threadId ==
                                                                ''
                                                        ? true
                                                        : false) {
                                                      _model.getAsistentDetails =
                                                          await OpenAIAssistentGroup
                                                              .getAssistentDetailsCall
                                                              .call(
                                                        assistentId:
                                                            realTimeNewUserTableRecord
                                                                .openAIAssistentId,
                                                        token:
                                                            getRemoteConfigString(
                                                                'openAI_key'),
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model
                                                              .getAsistentDetails
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.instructions =
                                                            OpenAIAssistentGroup
                                                                .getAssistentDetailsCall
                                                                .instructions(
                                                          (_model.getAsistentDetails
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        setState(() {});
                                                        _model.getFileID =
                                                            await VectorStorageGroup
                                                                .listOfUploadedFileCall
                                                                .call(
                                                          vsId: OpenAIAssistentGroup
                                                              .getAssistentDetailsCall
                                                              .vectorstoreids(
                                                                (_model.getAsistentDetails
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                              ?.first,
                                                          token:
                                                              getRemoteConfigString(
                                                                  'openAI_key'),
                                                        );

                                                        shouldSetState = true;
                                                        if ((_model.getFileID
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.apiThreadResult =
                                                              await OpenAIAssistentGroup
                                                                  .createThreadCall
                                                                  .call(
                                                            token:
                                                                getRemoteConfigString(
                                                                    'openAI_key'),
                                                            vectorStoreIds:
                                                                OpenAIAssistentGroup
                                                                    .getAssistentDetailsCall
                                                                    .vectorstoreids(
                                                                      (_model.getAsistentDetails
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                    ?.first,
                                                            instructions:
                                                                OpenAIAssistentGroup
                                                                    .getAssistentDetailsCall
                                                                    .instructions(
                                                              (_model.getAsistentDetails
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                          );

                                                          shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiThreadResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.threadId =
                                                                OpenAIAssistentGroup
                                                                    .createThreadCall
                                                                    .threadId(
                                                              (_model.apiThreadResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            setState(() {});

                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'visitor_count':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                  'messages_count':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });

                                                            await _model
                                                                .chatRecord!
                                                                .reference
                                                                .update(
                                                                    createChatHistoryRecordData(
                                                              threadId: _model
                                                                  .threadId,
                                                            ));

                                                            await _model
                                                                .firstMessage!
                                                                .reference
                                                                .update(
                                                                    createMessagesRecordData(
                                                              threadId: _model
                                                                  .threadId,
                                                            ));
                                                          } else {
                                                            await realTimeNewUserTableRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'logs': FieldValue
                                                                      .arrayUnion([
                                                                    '${getCurrentTimestamp.toString()}-Failed to create thread - ${(_model.apiThreadResult?.jsonBody ?? '').toString()}'
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }
                                                        } else {
                                                          await realTimeNewUserTableRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'logs': FieldValue
                                                                    .arrayUnion([
                                                                  '${getCurrentTimestamp.toString()}-Failed to GET file ID - ${(_model.getFileID?.jsonBody ?? '').toString()}'
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      } else {
                                                        await realTimeNewUserTableRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'logs': FieldValue
                                                                  .arrayUnion([
                                                                '${getCurrentTimestamp.toString()}-Failed to GET asistent details${(_model.getAsistentDetails?.jsonBody ?? '').toString()}'
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    } else {
                                                      await realTimeNewUserTableRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'logs': FieldValue
                                                                .arrayUnion([
                                                              '${getCurrentTimestamp.toString()}-Failed to start'
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }

                                                    _model.createMessageResponse =
                                                        await OpenAIAssistentGroup
                                                            .createMessageCall
                                                            .call(
                                                      threadId: _model.threadId,
                                                      token:
                                                          getRemoteConfigString(
                                                              'openAI_key'),
                                                      content: _model
                                                          .textController1.text,
                                                    );

                                                    shouldSetState = true;
                                                    if ((_model
                                                            .createMessageResponse
                                                            ?.succeeded ??
                                                        true)) {
                                                      unawaited(
                                                        () async {
                                                          await MessagesRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createMessagesRecordData(
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                userID: widget
                                                                    .id?.id,
                                                                uniqueID: _model
                                                                    .chatUniqueID,
                                                                sender: 'USER',
                                                                messageContent:
                                                                    _model
                                                                        .textController1
                                                                        .text,
                                                                threadId: _model
                                                                    .threadId,
                                                              ));
                                                        }(),
                                                      );
                                                      _model.soundPlayer4 ??=
                                                          AudioPlayer();
                                                      if (_model.soundPlayer4!
                                                          .playing) {
                                                        await _model
                                                            .soundPlayer4!
                                                            .stop();
                                                      }
                                                      _model.soundPlayer4!
                                                          .setVolume(1.0);
                                                      _model.soundPlayer4!
                                                          .setAsset(
                                                              'assets/audios/notification_sound.mp3')
                                                          .then((_) => _model
                                                              .soundPlayer4!
                                                              .play());

                                                      setState(() {
                                                        _model.textController1
                                                            ?.clear();
                                                      });
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500));
                                                      _model.createRunResponse =
                                                          await OpenAIAssistentGroup
                                                              .createRunCall
                                                              .call(
                                                        threadId:
                                                            _model.threadId,
                                                        assistantId:
                                                            realTimeNewUserTableRecord
                                                                .openAIAssistentId,
                                                        token:
                                                            getRemoteConfigString(
                                                                'openAI_key'),
                                                        instructions: functions
                                                            .convertToOneline(_model
                                                                .instructions!),
                                                        maxCompletionTokens:
                                                            valueOrDefault<int>(
                                                          realTimeNewUserTableRecord
                                                              .maximumTokenToUseForBotAnswer,
                                                          500,
                                                        ),
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model
                                                              .createRunResponse
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.runId =
                                                            OpenAIAssistentGroup
                                                                .createRunCall
                                                                .runId(
                                                          (_model.createRunResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        setState(() {});
                                                        while (_model.status !=
                                                            'completed') {
                                                          _model.runRetriveResponse =
                                                              await OpenAIAssistentGroup
                                                                  .retriveRunCall
                                                                  .call(
                                                            threadId:
                                                                _model.threadId,
                                                            runId: _model.runId,
                                                            token:
                                                                getRemoteConfigString(
                                                                    'openAI_key'),
                                                          );

                                                          shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .runRetriveResponse
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.status =
                                                                OpenAIAssistentGroup
                                                                    .retriveRunCall
                                                                    .status(
                                                              (_model.runRetriveResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            setState(() {});
                                                            if (_model.status !=
                                                                'completed') {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1500));
                                                            }
                                                          } else {
                                                            await realTimeNewUserTableRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'logs': FieldValue
                                                                      .arrayUnion([
                                                                    '${getCurrentTimestamp.toString()}-Failed to RUN retrieve - ${(_model.runRetriveResponse?.jsonBody ?? '').toString()}'
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                        }
                                                        _model.aiResponseForMessage =
                                                            await OpenAIAssistentGroup
                                                                .messageCall
                                                                .call(
                                                          threadId:
                                                              _model.threadId,
                                                          token:
                                                              getRemoteConfigString(
                                                                  'openAI_key'),
                                                        );

                                                        shouldSetState = true;
                                                        if ((_model
                                                                .aiResponseForMessage
                                                                ?.succeeded ??
                                                            true)) {
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1500));
                                                          _model.status = null;
                                                          setState(() {});
                                                          unawaited(
                                                            () async {
                                                              await _model
                                                                  .chatRecord!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'used_token':
                                                                        FieldValue.increment(OpenAIAssistentGroup
                                                                            .retriveRunCall
                                                                            .totalToken(
                                                                      (_model.runRetriveResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!),
                                                                  },
                                                                ),
                                                              });
                                                            }(),
                                                          );

                                                          await MessagesRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createMessagesRecordData(
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                userID: widget
                                                                    .id?.id,
                                                                uniqueID: _model
                                                                    .chatUniqueID,
                                                                sender: 'AI',
                                                                messageContent:
                                                                    OpenAIAssistentGroup
                                                                        .messageCall
                                                                        .responseText(
                                                                  (_model.aiResponseForMessage
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                threadId: _model
                                                                    .threadId,
                                                              ));
                                                          _model.soundPlayer5 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer5!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer5!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer5!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer5!
                                                              .setAsset(
                                                                  'assets/audios/notification_sound.mp3')
                                                              .then((_) => _model
                                                                  .soundPlayer5!
                                                                  .play());

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'used_token': FieldValue.increment(
                                                                    OpenAIAssistentGroup
                                                                        .retriveRunCall
                                                                        .totalToken(
                                                                  (_model.runRetriveResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!),
                                                                'messages_count':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          await realTimeNewUserTableRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'logs': FieldValue
                                                                    .arrayUnion([
                                                                  '${getCurrentTimestamp.toString()}-Failed to retrieve message - ${(_model.aiResponseForMessage?.jsonBody ?? '').toString()}'
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      } else {
                                                        await realTimeNewUserTableRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'logs': FieldValue
                                                                  .arrayUnion([
                                                                '${getCurrentTimestamp.toString()}-Failed to create RUN - ${(_model.createRunResponse?.jsonBody ?? '').toString()}'
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    } else {
                                                      await realTimeNewUserTableRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'logs': FieldValue
                                                                .arrayUnion([
                                                              '${getCurrentTimestamp.toString()}-Failed to create message -${(_model.createMessageResponse?.jsonBody ?? '').toString()}'
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  } else {
                                                    await MessagesRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createMessagesRecordData(
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          userID: widget.id?.id,
                                                          uniqueID: _model
                                                              .chatUniqueID,
                                                          sender: 'USER',
                                                          messageContent: _model
                                                              .textController1
                                                              .text,
                                                        ));
                                                    setState(() {
                                                      _model.textController1
                                                          ?.clear();
                                                    });
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                },
                                                text: 'Send',
                                                options: FFButtonOptions(
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: valueOrDefault<Color>(
                                                    realTimeNewUserTableRecord
                                                        .colorSendButtonBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          realTimeNewUserTableRecord
                                                              .colorSendButtonText,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Powered By',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              TextSpan(
                                                text: ' - Botto',
                                                style: TextStyle(
                                                  color: valueOrDefault<Color>(
                                                    currentUserDocument
                                                        ?.colorSendButtonBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                  ),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (_model.collectUserData == true)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      constraints: BoxConstraints(
                                        minHeight:
                                            MediaQuery.sizeOf(context).height *
                                                0.35,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 10.0),
                                        child: SingleChildScrollView(
                                          controller: _model.columnController1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                width: 100.0,
                                                child: Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              Text(
                                                realTimeNewUserTableRecord
                                                    .welcomeMessageForVisitor,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'We would love to talk with you. Under the EU General Data Protection Regulation, we need your approval for our use of personal information (e.g. your name and email address). Please provide details',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              if (realTimeNewUserTableRecord
                                                      .collectUserDataBusinessName ==
                                                  true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .businesNameTextController,
                                                    focusNode: _model
                                                        .businesNameFocusNode,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Business Name',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    validator: _model
                                                        .businesNameTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.collectUserDataUsername,
                                                      false) ==
                                                  true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        TextFormField(
                                                      controller: _model
                                                          .textController3,
                                                      focusNode: _model
                                                          .textFieldFocusNode2,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Username',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      validator: _model
                                                          .textController3Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              if (realTimeNewUserTableRecord
                                                      .collectUserDataEmail ==
                                                  true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController4,
                                                    focusNode: _model
                                                        .textFieldFocusNode3,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Email Id',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: _model
                                                        .textController4Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              if (realTimeNewUserTableRecord
                                                      .collectUserDataPhoneNumber ==
                                                  true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController5,
                                                    focusNode: _model
                                                        .textFieldFocusNode4,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Phone number',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    validator: _model
                                                        .textController5Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .chatRecord!.reference
                                                          .update(
                                                              createChatHistoryRecordData(
                                                        visitorName:
                                                            valueOrDefault<
                                                                String>(
                                                          _model.textController3
                                                              .text,
                                                          'User',
                                                        ),
                                                        visitorEmail: _model
                                                            .textController4
                                                            .text,
                                                        visitorPhoneNumber:
                                                            int.tryParse(_model
                                                                .reportedPhoennumberTextController
                                                                .text),
                                                        businessName: _model
                                                            .businesNameTextController
                                                            .text,
                                                      ));
                                                      _model.collectUserData =
                                                          false;
                                                      setState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Thank you!',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    },
                                                    text: 'Start Chat',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: realTimeNewUserTableRecord
                                                          .colorSendButtonBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: realTimeNewUserTableRecord
                                                                    .colorSendButtonText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 16.0)),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.report == false)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.45,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            18.0, 18.0, 18.0, 10.0),
                                        child: SingleChildScrollView(
                                          controller: _model.columnController2,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                width: 100.0,
                                                child: Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              Text(
                                                'Raise your issue. Our executive will contact you.',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .reportedUsernameTextController,
                                                  focusNode: _model
                                                      .reportedUsernameFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Username',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  validator: _model
                                                      .reportedUsernameTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .reportedEmailTextController,
                                                  focusNode: _model
                                                      .reportedEmailFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Email Id',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  validator: _model
                                                      .reportedEmailTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .reportedPhoennumberTextController,
                                                  focusNode: _model
                                                      .reportedPhoennumberFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Phone number',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  validator: _model
                                                      .reportedPhoennumberTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController9,
                                                  focusNode: _model
                                                      .textFieldFocusNode5,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Problem',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  maxLines: null,
                                                  minLines: 3,
                                                  validator: _model
                                                      .textController9Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          allowPhoto: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          setState(() => _model
                                                                  .isDataUploading =
                                                              true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];

                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes),
                                                              ),
                                                            ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                          } finally {
                                                            _model.isDataUploading =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            setState(() {
                                                              _model.uploadedLocalFile =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            setState(() {});
                                                            return;
                                                          }
                                                        }
                                                      },
                                                      child: Text(
                                                        'Upload screenshot',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    if (_model.uploadedFileUrl !=
                                                            '')
                                                      Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 24.0,
                                                      ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await ReportedIssueRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createReportedIssueRecordData(
                                                            userID:
                                                                widget.id?.id,
                                                            reportedProblem: _model
                                                                .textController9
                                                                .text,
                                                            reporterEmail: _model
                                                                .reportedEmailTextController
                                                                .text,
                                                            reporterPhoneNumber:
                                                                int.tryParse(_model
                                                                    .reportedPhoennumberTextController
                                                                    .text),
                                                            reporterDate:
                                                                getCurrentTimestamp,
                                                            screenshot: _model
                                                                .uploadedFileUrl,
                                                          ));
                                                      _model.report = true;
                                                      setState(() {});
                                                    },
                                                    text: 'Report Issue',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.report = true;
                                                      setState(() {});
                                                    },
                                                    text: 'Close',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 16.0)),
                                              ),
                                            ].divide(const SizedBox(height: 14.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
