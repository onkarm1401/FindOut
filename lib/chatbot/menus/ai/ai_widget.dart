import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'ai_model.dart';
export 'ai_model.dart';

class AiWidget extends StatefulWidget {
  const AiWidget({
    super.key,
    required this.id,
  });

  final DocumentReference? id;

  @override
  State<AiWidget> createState() => _AiWidgetState();
}

class _AiWidgetState extends State<AiWidget> {
  late AiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.chatUniqueID = random_data.randomString(
          8,
          20,
          true,
          true,
          true,
        );
      });
      unawaited(
        () async {
          var chatHistoryRecordReference = ChatHistoryRecord.collection.doc();
          await chatHistoryRecordReference.set(createChatHistoryRecordData(
            userID: widget.id?.id,
            chatDate: getCurrentTimestamp,
            chatUniqueId: _model.chatUniqueID,
          ));
          _model.chatRecord = ChatHistoryRecord.getDocumentFromData(
              createChatHistoryRecordData(
                userID: widget.id?.id,
                chatDate: getCurrentTimestamp,
                chatUniqueId: _model.chatUniqueID,
              ),
              chatHistoryRecordReference);
        }(),
      );
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

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
        final aiUserTableRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        aiUserTableRecord.colorChatbotHeader,
                        FlutterFlowTheme.of(context).secondary,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
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
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: aiUserTableRecord.chatbotLogo,
                                fit: BoxFit.cover,
                                errorWidget: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      aiUserTableRecord.chatbotName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: valueOrDefault<Color>(
                                              aiUserTableRecord
                                                  .colorHeaderTextColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      aiUserTableRecord.chatbotDescripation,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: valueOrDefault<Color>(
                                              aiUserTableRecord
                                                  .colorHeaderTextColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed(
                                      'AI',
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
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
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
                                if (_model.chatHistory.isEmpty)
                                  Flexible(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        aiUserTableRecord
                                            .welcomeMessageForVisitor,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                Flexible(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Builder(
                                        builder: (context) {
                                          final chat =
                                              _model.chatHistory.toList();
                                          return ListView.separated(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: chat.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 12.0),
                                            itemBuilder: (context, chatIndex) {
                                              final chatItem = chat[chatIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if ((int index) {
                                                    return index % 2 != 0;
                                                  }(chatIndex))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
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
                                                                  aiUserTableRecord
                                                                      .chatbotLogo,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minHeight: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.06,
                                                              maxWidth: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.65,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                aiUserTableRecord
                                                                    .colorChatbotMessageBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                child: Text(
                                                                  chatItem.text
                                                                      .value,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          aiUserTableRecord
                                                                              .colorChatbotMessageText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  if (chatIndex % 2 == 0)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minHeight: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.06,
                                                              maxWidth: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.65,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                aiUserTableRecord
                                                                    .colorUserMessageBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        1.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                child: Text(
                                                                  chatItem.text
                                                                      .value,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          aiUserTableRecord
                                                                              .colorUserMessageText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                            width: 32.0,
                                                            height: 32.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
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
                                                                  aiUserTableRecord
                                                                      .userLogo,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                ].divide(
                                                    const SizedBox(height: 14.0)),
                                              );
                                            },
                                            controller:
                                                _model.listViewController,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                if ((currentUserDocument?.expectedQuestions
                                                .toList() ??
                                            []).isNotEmpty)
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          14.0, 12.0, 14.0, 12.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final expectQue = aiUserTableRecord
                                                .expectedQuestions
                                                .toList();
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              controller: _model.rowController,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: List.generate(
                                                    expectQue.length,
                                                    (expectQueIndex) {
                                                  final expectQueItem =
                                                      expectQue[expectQueIndex];
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      var shouldSetState =
                                                          false;
                                                      if (_model.threadId ==
                                                                  null ||
                                                              _model.threadId ==
                                                                  ''
                                                          ? true
                                                          : false) {
                                                        _model.apiThreadResultCopy =
                                                            await OpenAIAssistentGroup
                                                                .createThreadCall
                                                                .call(
                                                          token:
                                                              getRemoteConfigString(
                                                                  'openAI_key'),
                                                        );
                                                        shouldSetState = true;
                                                        if ((_model
                                                                .apiThreadResultCopy
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() {
                                                            _model.threadId =
                                                                OpenAIAssistentGroup
                                                                    .createThreadCall
                                                                    .threadId(
                                                              (_model.apiThreadResultCopy
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                          });

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
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Failed to start communication. Please contact support team',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }
                                                      }
                                                      _model.createMessageResponseCopy =
                                                          await OpenAIAssistentGroup
                                                              .createMessageCall
                                                              .call(
                                                        threadId:
                                                            _model.threadId,
                                                        token:
                                                            getRemoteConfigString(
                                                                'openAI_key'),
                                                        content: expectQueItem,
                                                      );
                                                      shouldSetState = true;
                                                      if ((_model
                                                              .createMessageResponseCopy
                                                              ?.succeeded ??
                                                          true)) {
                                                        unawaited(
                                                          () async {
                                                            await _model
                                                                .chatRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'chatMessages':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getContentFirestoreData(
                                                                      updateContentStruct(
                                                                        ContentStruct.maybeFromMap(
                                                                            getJsonField(
                                                                          (_model.createMessageResponseCopy?.jsonBody ??
                                                                              ''),
                                                                          r'''$.content[0]''',
                                                                        )),
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          }(),
                                                        );
                                                        setState(() {
                                                          _model.addToChatHistory(
                                                              ContentStruct
                                                                  .maybeFromMap(
                                                                      getJsonField(
                                                            (_model.createMessageResponseCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.content[0]''',
                                                          ))!);
                                                        });
                                                        setState(() {
                                                          _model.textController1
                                                              ?.clear();
                                                        });
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500));
                                                        await _model
                                                            .listViewController
                                                            ?.animateTo(
                                                          _model
                                                              .listViewController!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );
                                                        _model.createRunResponseCopy =
                                                            await OpenAIAssistentGroup
                                                                .createRunCall
                                                                .call(
                                                          threadId:
                                                              _model.threadId,
                                                          assistantId:
                                                              aiUserTableRecord
                                                                  .openAIAssistentId,
                                                          token:
                                                              getRemoteConfigString(
                                                                  'openAI_key'),
                                                        );
                                                        shouldSetState = true;
                                                        if ((_model
                                                                .createRunResponseCopy
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() {
                                                            _model.runId =
                                                                OpenAIAssistentGroup
                                                                    .createRunCall
                                                                    .runId(
                                                              (_model.createRunResponseCopy
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                          });
                                                          while (
                                                              _model.status !=
                                                                  'completed') {
                                                            _model.runRetriveResponseCopy =
                                                                await OpenAIAssistentGroup
                                                                    .retriveRunCall
                                                                    .call(
                                                              threadId: _model
                                                                  .threadId,
                                                              runId:
                                                                  _model.runId,
                                                              token: getRemoteConfigString(
                                                                  'openAI_key'),
                                                            );
                                                            shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .runRetriveResponseCopy
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model.status =
                                                                    OpenAIAssistentGroup
                                                                        .retriveRunCall
                                                                        .status(
                                                                  (_model.runRetriveResponseCopy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                );
                                                              });
                                                              if (_model
                                                                      .status !=
                                                                  'completed') {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500));
                                                              }
                                                            }
                                                          }
                                                          _model.aiResponseForMessageCopy =
                                                              await OpenAIAssistentGroup
                                                                  .messageCall
                                                                  .call(
                                                            threadId:
                                                                _model.threadId,
                                                            token:
                                                                getRemoteConfigString(
                                                                    'openAI_key'),
                                                          );
                                                          shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .aiResponseForMessageCopy
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() {
                                                              _model.addToChatHistory(
                                                                  ContentStruct.maybeFromMap(
                                                                      OpenAIAssistentGroup
                                                                          .messageCall
                                                                          .data(
                                                                (_model.aiResponseForMessageCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ))!);
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        500));
                                                            await _model
                                                                .listViewController
                                                                ?.animateTo(
                                                              _model
                                                                  .listViewController!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            setState(() {
                                                              _model.status =
                                                                  null;
                                                            });
                                                            unawaited(
                                                              () async {
                                                                await _model
                                                                    .chatRecord!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'chatMessages':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getContentFirestoreData(
                                                                          updateContentStruct(
                                                                            ContentStruct.maybeFromMap(OpenAIAssistentGroup.messageCall.data(
                                                                              (_model.aiResponseForMessageCopy?.jsonBody ?? ''),
                                                                            )),
                                                                            clearUnsetFields:
                                                                                true,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              }(),
                                                            );
                                                            unawaited(
                                                              () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'used_token': FieldValue.increment(OpenAIAssistentGroup
                                                                          .retriveRunCall
                                                                          .totalToken(
                                                                        (_model.runRetriveResponseCopy?.jsonBody ??
                                                                            ''),
                                                                      )!),
                                                                      'messages_count':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });
                                                              }(),
                                                            );
                                                          }
                                                        }
                                                      }
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    text: expectQueItem,
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF868E93),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  );
                                                }).divide(
                                                    const SizedBox(width: 12.0)),
                                              ),
                                            );
                                          },
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
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 0.0, 10.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    TextFormField(
                                                  controller:
                                                      _model.textController1,
                                                  focusNode: _model
                                                      .textFieldFocusNode1,
                                                  autofocus: true,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        valueOrDefault<String>(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.chatbotTextBoxPlaceholder,
                                                          ''),
                                                      'Ask something ...',
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          aiUserTableRecord
                                                              .colorSendButtonBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                        ),
                                                        width: 1.0,
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
                                                        width: 1.0,
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
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .textController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var shouldSetState = false;
                                              if (_model.threadId == null ||
                                                      _model.threadId == ''
                                                  ? true
                                                  : false) {
                                                _model.apiThreadResult =
                                                    await OpenAIAssistentGroup
                                                        .createThreadCall
                                                        .call(
                                                  token: getRemoteConfigString(
                                                      'openAI_key'),
                                                );
                                                shouldSetState = true;
                                                if ((_model.apiThreadResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    _model.threadId =
                                                        OpenAIAssistentGroup
                                                            .createThreadCall
                                                            .threadId(
                                                      (_model.apiThreadResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    );
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'visitor_count':
                                                            FieldValue
                                                                .increment(1),
                                                        'messages_count':
                                                            FieldValue
                                                                .increment(1),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }
                                              }
                                              _model.createMessageResponse =
                                                  await OpenAIAssistentGroup
                                                      .createMessageCall
                                                      .call(
                                                threadId: _model.threadId,
                                                token: getRemoteConfigString(
                                                    'openAI_key'),
                                                content:
                                                    _model.textController1.text,
                                              );
                                              shouldSetState = true;
                                              if ((_model.createMessageResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                unawaited(
                                                  () async {
                                                    await _model
                                                        .chatRecord!.reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'chatMessages':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            getContentFirestoreData(
                                                              updateContentStruct(
                                                                ContentStruct
                                                                    .maybeFromMap(
                                                                        getJsonField(
                                                                  (_model.createMessageResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.content[0]''',
                                                                )),
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              true,
                                                            )
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }(),
                                                );
                                                setState(() {
                                                  _model.addToChatHistory(
                                                      ContentStruct
                                                          .maybeFromMap(
                                                              getJsonField(
                                                    (_model.createMessageResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.content[0]''',
                                                  ))!);
                                                });
                                                setState(() {
                                                  _model.textController1
                                                      ?.clear();
                                                });
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));
                                                await _model.listViewController
                                                    ?.animateTo(
                                                  _model.listViewController!
                                                      .position.maxScrollExtent,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                                _model.createRunResponse =
                                                    await OpenAIAssistentGroup
                                                        .createRunCall
                                                        .call(
                                                  threadId: _model.threadId,
                                                  assistantId: aiUserTableRecord
                                                      .openAIAssistentId,
                                                  token: getRemoteConfigString(
                                                      'openAI_key'),
                                                );
                                                shouldSetState = true;
                                                if ((_model.createRunResponse
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    _model.runId =
                                                        OpenAIAssistentGroup
                                                            .createRunCall
                                                            .runId(
                                                      (_model.createRunResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    );
                                                  });
                                                  while (_model.status !=
                                                      'completed') {
                                                    _model.runRetriveResponse =
                                                        await OpenAIAssistentGroup
                                                            .retriveRunCall
                                                            .call(
                                                      threadId: _model.threadId,
                                                      runId: _model.runId,
                                                      token:
                                                          getRemoteConfigString(
                                                              'openAI_key'),
                                                    );
                                                    shouldSetState = true;
                                                    if ((_model
                                                            .runRetriveResponse
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.status =
                                                            OpenAIAssistentGroup
                                                                .retriveRunCall
                                                                .status(
                                                          (_model.runRetriveResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                      });
                                                      if (_model.status !=
                                                          'completed') {
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                      }
                                                    }
                                                  }
                                                  _model.aiResponseForMessage =
                                                      await OpenAIAssistentGroup
                                                          .messageCall
                                                          .call(
                                                    threadId: _model.threadId,
                                                    token:
                                                        getRemoteConfigString(
                                                            'openAI_key'),
                                                  );
                                                  shouldSetState = true;
                                                  if ((_model
                                                          .aiResponseForMessage
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.addToChatHistory(
                                                          ContentStruct.maybeFromMap(
                                                              OpenAIAssistentGroup
                                                                  .messageCall
                                                                  .data(
                                                        (_model.aiResponseForMessage
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!);
                                                    });
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                1500));
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
                                                    setState(() {
                                                      _model.status = null;
                                                    });
                                                    unawaited(
                                                      () async {
                                                        await _model.chatRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'chatMessages':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                getContentFirestoreData(
                                                                  updateContentStruct(
                                                                    ContentStruct.maybeFromMap(
                                                                        OpenAIAssistentGroup
                                                                            .messageCall
                                                                            .data(
                                                                      (_model.aiResponseForMessage
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )),
                                                                    clearUnsetFields:
                                                                        true,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }(),
                                                    );
                                                    unawaited(
                                                      () async {
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
                                                      }(),
                                                    );
                                                    if (_model.chatHistory.last
                                                            .text.value ==
                                                        aiUserTableRecord
                                                            .noAnswerBotReplyText) {
                                                      setState(() {
                                                        _model.reportProblem =
                                                            valueOrDefault<
                                                                String>(
                                                          _model.chatHistory
                                                              .last.text.value,
                                                          'Test',
                                                        );
                                                      });
                                                    }
                                                  }
                                                }
                                              }
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Send',
                                            options: FFButtonOptions(
                                              height: 46.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                aiUserTableRecord
                                                    .colorSendButtonBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                              ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      aiUserTableRecord
                                                          .colorSendButtonText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          TextSpan(
                                            text: ' - OM Chatbot',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_model.reportProblem != null &&
                              _model.reportProblem != '')
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 18.0, 18.0, 10.0),
                                    child: SingleChildScrollView(
                                      controller: _model.columnController,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            width: 100.0,
                                            child: Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          Text(
                                            'Raise your issue. Our executive will contact you.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Username',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFA2AFB8),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: null,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController3,
                                              focusNode:
                                                  _model.textFieldFocusNode3,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Email Id',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFA2AFB8),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: null,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController4,
                                              focusNode:
                                                  _model.textFieldFocusNode4,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Phone number',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFA2AFB8),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: null,
                                              validator: _model
                                                  .textController4Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController5,
                                              focusNode:
                                                  _model.textFieldFocusNode5,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Problem',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: null,
                                              minLines: 3,
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
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'Report Issue',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
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
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.goNamed(
                                                    'AI',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        widget.id,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                text: 'Restart',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
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
        );
      },
    );
  }
}
