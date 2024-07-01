import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'test_chatbot_model.dart';
export 'test_chatbot_model.dart';

class TestChatbotWidget extends StatefulWidget {
  const TestChatbotWidget({super.key});

  @override
  State<TestChatbotWidget> createState() => _TestChatbotWidgetState();
}

class _TestChatbotWidgetState extends State<TestChatbotWidget>
    with TickerProviderStateMixin {
  late TestChatbotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestChatbotModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (valueOrDefault(currentUserDocument?.openAIAssistentId, '') !=
                  '') {
            if (valueOrDefault(currentUserDocument?.openAIAssistentId, '') == ''
                ? false
                : true) {
              _model.getAsistent =
                  await OpenAIAssistentGroup.getAssistentDetailsCall.call(
                assistentId:
                    valueOrDefault(currentUserDocument?.openAIAssistentId, ''),
                token: getRemoteConfigString('openAI_key'),
              );

              _model.apiThreadResult =
                  await OpenAIAssistentGroup.createThreadCall.call(
                token: getRemoteConfigString('openAI_key'),
                vectorStoreIds: OpenAIAssistentGroup.getAssistentDetailsCall
                    .vectorstoreids(
                      (_model.getAsistent?.jsonBody ?? ''),
                    )
                    ?.first,
                instructions:
                    OpenAIAssistentGroup.getAssistentDetailsCall.instructions(
                  (_model.getAsistent?.jsonBody ?? ''),
                ),
              );

              if ((_model.apiThreadResult?.succeeded ?? true)) {
                _model.threadId =
                    OpenAIAssistentGroup.createThreadCall.threadId(
                  (_model.apiThreadResult?.jsonBody ?? ''),
                );
                _model.addToChatHistory(ContentStruct(
                  text: TextStruct(
                    value: valueOrDefault(
                        currentUserDocument?.welcomeMessageForVisitor, ''),
                  ),
                ));
                setState(() {});
                _model.soundPlayer1 ??= AudioPlayer();
                if (_model.soundPlayer1!.playing) {
                  await _model.soundPlayer1!.stop();
                }
                _model.soundPlayer1!.setVolume(1.0);
                _model.soundPlayer1!
                    .setAsset('assets/audios/notification_sound.mp3')
                    .then((_) => _model.soundPlayer1!.play());
              } else {
                _model.addToLogs('Failed to create thread');
                setState(() {});
                _model.addToLogs(
                    (_model.apiThreadResult?.jsonBody ?? '').toString());
                setState(() {});

                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'internal_error_log': FieldValue.arrayUnion([
                        '${getCurrentTimestamp.toString()}- Failed to create thread - ${(_model.apiThreadResult?.jsonBody ?? '').toString()}'
                      ]),
                    },
                  ),
                });
              }
            } else {
              context.pushNamed('createAsistent');
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Setup is incomplete.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
          }
        }),
        Future(() async {
          if (currentUserDocument!.planExpiryDate! >= getCurrentTimestamp) {
            if (!((valueOrDefault(currentUserDocument?.chatLimit, 0) >=
                    valueOrDefault(currentUserDocument?.messagesCount, 0)) &&
                (valueOrDefault(currentUserDocument?.charLimit, 0) >=
                    valueOrDefault(currentUserDocument?.usedToken, 0)))) {
              context.pushNamed(
                'pricing-model',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          } else {
            context.pushNamed(
              'pricing-model',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          }
        }),
      ]);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return Title(
        title: 'playground',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.apiResulttfx =
                          await OpenAIAssistentGroup.deleteThreadCall.call(
                        threadId: _model.threadId,
                        token: getRemoteConfigString('openAI_key'),
                      );

                      if (!(_model.apiResulttfx?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to delete message thread',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }

                      setState(() {});
                    },
                    child: wrapWithModel(
                      model: _model.sideNavModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: const SideNavWidget(
                        selectedNav: 7,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (_model.chatbotVisiblity == true)
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 12.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          currentUserDocument
                                                              ?.colorChatbotHeader,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  16.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
                                                                        valueOrDefault(
                                                                            currentUserDocument?.chatbotLogo,
                                                                            ''),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.webp',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chatbotLogo,
                                                                          ''),
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.chatbotLogo,
                                                                    ''),
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    Container(
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.chatbotLogo,
                                                                        ''),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
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
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault(
                                                                            currentUserDocument?.chatbotName,
                                                                            ''),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: valueOrDefault<Color>(
                                                                                currentUserDocument?.colorHeaderTextColor,
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              fontSize: 24.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault(
                                                                            currentUserDocument?.chatbotDescripation,
                                                                            ''),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: valueOrDefault<Color>(
                                                                                currentUserDocument?.colorHeaderTextColor,
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final chat = _model
                                                                .chatHistory
                                                                .toList();
                                                            return ListView
                                                                .separated(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          12.0),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  chat.length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  const SizedBox(
                                                                      height:
                                                                          12.0),
                                                              itemBuilder:
                                                                  (context,
                                                                      chatIndex) {
                                                                final chatItem =
                                                                    chat[
                                                                        chatIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (chatIndex %
                                                                            2 ==
                                                                        0)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 1.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => Container(
                                                                                width: 32.0,
                                                                                height: 32.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: const BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault(currentUserDocument?.chatbotLogo, ''),
                                                                                  fit: BoxFit.cover,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.webp',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.26,
                                                                                  constraints: BoxConstraints(
                                                                                    minHeight: MediaQuery.sizeOf(context).height * 0.06,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: valueOrDefault<Color>(
                                                                                      currentUserDocument?.colorChatbotMessageBackground,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(valueOrDefault<double>(
                                                                                        valueOrDefault(currentUserDocument?.messageBroderRadius4, 0).toDouble(),
                                                                                        0.0,
                                                                                      )),
                                                                                      bottomRight: Radius.circular(valueOrDefault<double>(
                                                                                        valueOrDefault(currentUserDocument?.messageBroderRadius3, 0).toDouble(),
                                                                                        0.0,
                                                                                      )),
                                                                                      topLeft: Radius.circular(valueOrDefault<double>(
                                                                                        valueOrDefault(currentUserDocument?.messageBroderRadius2, 0).toDouble(),
                                                                                        0.0,
                                                                                      )),
                                                                                      topRight: Radius.circular(valueOrDefault<double>(
                                                                                        valueOrDefault(currentUserDocument?.messageBroderRadius1, 0).toDouble(),
                                                                                        0.0,
                                                                                      )),
                                                                                    ),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(14.0, 8.0, 14.0, 8.0),
                                                                                      child: Text(
                                                                                        chatItem.text.value,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: valueOrDefault<Color>(
                                                                                                currentUserDocument?.colorChatbotMessageText,
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
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 12.0)),
                                                                      ),
                                                                    if ((int
                                                                        index) {
                                                                      return index %
                                                                              2 !=
                                                                          0;
                                                                    }(chatIndex))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.26,
                                                                                constraints: BoxConstraints(
                                                                                  minHeight: MediaQuery.sizeOf(context).height * 0.06,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    currentUserDocument?.colorUserMessageBackground,
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(valueOrDefault<double>(
                                                                                      valueOrDefault(currentUserDocument?.messageBroderRadius3, 0).toDouble(),
                                                                                      0.0,
                                                                                    )),
                                                                                    bottomRight: Radius.circular(valueOrDefault<double>(
                                                                                      valueOrDefault(currentUserDocument?.messageBroderRadius4, 0).toDouble(),
                                                                                      0.0,
                                                                                    )),
                                                                                    topLeft: Radius.circular(valueOrDefault<double>(
                                                                                      valueOrDefault(currentUserDocument?.messageBroderRadius1, 0).toDouble(),
                                                                                      0.0,
                                                                                    )),
                                                                                    topRight: Radius.circular(valueOrDefault<double>(
                                                                                      valueOrDefault(currentUserDocument?.messageBroderRadius2, 0).toDouble(),
                                                                                      0.0,
                                                                                    )),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(14.0, 8.0, 14.0, 8.0),
                                                                                    child: Text(
                                                                                      chatItem.text.value,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: valueOrDefault<Color>(
                                                                                              currentUserDocument?.colorUserMessageText,
                                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 1.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => Container(
                                                                                width: 32.0,
                                                                                height: 32.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: const BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault(currentUserDocument?.userLogo, ''),
                                                                                  fit: BoxFit.cover,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.webp',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 12.0)),
                                                                      ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          14.0)),
                                                                );
                                                              },
                                                              controller: _model
                                                                  .listViewController,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  8.0,
                                                                  16.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode,
                                                                    autofocus:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        valueOrDefault(
                                                                            currentUserDocument?.chatbotTextBoxPlaceholder,
                                                                            ''),
                                                                        'Ask something ...',
                                                                      ),
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                          ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            currentUserDocument?.colorSendButtonBackground,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    validator: _model
                                                                        .textControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model.createMessageResponse =
                                                                      await OpenAIAssistentGroup
                                                                          .createMessageCall
                                                                          .call(
                                                                    threadId: _model
                                                                        .threadId,
                                                                    token: getRemoteConfigString(
                                                                        'openAI_key'),
                                                                    content: _model
                                                                        .textController
                                                                        .text,
                                                                  );

                                                                  _model.soundPlayer2 ??=
                                                                      AudioPlayer();
                                                                  if (_model
                                                                      .soundPlayer2!
                                                                      .playing) {
                                                                    await _model
                                                                        .soundPlayer2!
                                                                        .stop();
                                                                  }
                                                                  _model
                                                                      .soundPlayer2!
                                                                      .setVolume(
                                                                          1.0);
                                                                  _model
                                                                      .soundPlayer2!
                                                                      .setAsset(
                                                                          'assets/audios/notification_sound.mp3')
                                                                      .then((_) => _model
                                                                          .soundPlayer2!
                                                                          .play());

                                                                  if ((_model
                                                                          .createMessageResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.addToChatHistory(
                                                                        ContentStruct.maybeFromMap(
                                                                            getJsonField(
                                                                      (_model.createMessageResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.content[0]''',
                                                                    ))!);
                                                                    setState(
                                                                        () {});
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .textController
                                                                          ?.clear();
                                                                    });
                                                                    await Future.delayed(const Duration(
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
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                    _model.createRunResponse =
                                                                        await OpenAIAssistentGroup
                                                                            .createRunCall
                                                                            .call(
                                                                      threadId:
                                                                          _model
                                                                              .threadId,
                                                                      assistantId: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.openAIAssistentId,
                                                                          ''),
                                                                      token: getRemoteConfigString(
                                                                          'openAI_key'),
                                                                      instructions: OpenAIAssistentGroup
                                                                          .getAssistentDetailsCall
                                                                          .instructions(
                                                                        (_model.getAsistent?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      maxCompletionTokens:
                                                                          valueOrDefault(
                                                                              currentUserDocument?.maximumTokenToUseForBotAnswer,
                                                                              0),
                                                                    );

                                                                    if ((_model
                                                                            .createRunResponse
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.runId = OpenAIAssistentGroup
                                                                          .createRunCall
                                                                          .runId(
                                                                        (_model.createRunResponse?.jsonBody ??
                                                                            ''),
                                                                      );
                                                                      setState(
                                                                          () {});
                                                                      while (_model
                                                                              .status !=
                                                                          'completed') {
                                                                        _model.runRetriveResponse = await OpenAIAssistentGroup
                                                                            .retriveRunCall
                                                                            .call(
                                                                          threadId:
                                                                              _model.threadId,
                                                                          runId:
                                                                              _model.runId,
                                                                          token:
                                                                              getRemoteConfigString('openAI_key'),
                                                                        );

                                                                        if ((_model.runRetriveResponse?.succeeded ??
                                                                            true)) {
                                                                          _model.status = OpenAIAssistentGroup
                                                                              .retriveRunCall
                                                                              .status(
                                                                            (_model.runRetriveResponse?.jsonBody ??
                                                                                ''),
                                                                          );
                                                                          setState(
                                                                              () {});
                                                                          if (_model.status !=
                                                                              'completed') {
                                                                            await Future.delayed(const Duration(milliseconds: 2000));
                                                                          } else {
                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'internal_error_log': FieldValue.arrayUnion([
                                                                                    '${getCurrentTimestamp.toString()}Failed while waiting to response'
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                          }
                                                                        } else {
                                                                          await currentUserReference!
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'internal_error_log': FieldValue.arrayUnion([
                                                                                  '${getCurrentTimestamp.toString()}Failed to create retrieve  - ${(_model.runRetriveResponse?.jsonBody ?? '').toString()}'
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      }
                                                                      _model.aiResponseForMessage = await OpenAIAssistentGroup
                                                                          .messageCall
                                                                          .call(
                                                                        threadId:
                                                                            _model.threadId,
                                                                        token: getRemoteConfigString(
                                                                            'openAI_key'),
                                                                      );

                                                                      if ((_model
                                                                              .aiResponseForMessage
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        _model.addToChatHistory(ContentStruct.maybeFromMap(OpenAIAssistentGroup
                                                                            .messageCall
                                                                            .data(
                                                                          (_model.aiResponseForMessage?.jsonBody ??
                                                                              ''),
                                                                        ))!);
                                                                        setState(
                                                                            () {});
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                1500));
                                                                        await _model
                                                                            .listViewController
                                                                            ?.animateTo(
                                                                          _model
                                                                              .listViewController!
                                                                              .position
                                                                              .maxScrollExtent,
                                                                          duration:
                                                                              const Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        _model.status =
                                                                            '';
                                                                        setState(
                                                                            () {});
                                                                        _model.soundPlayer3 ??=
                                                                            AudioPlayer();
                                                                        if (_model
                                                                            .soundPlayer3!
                                                                            .playing) {
                                                                          await _model
                                                                              .soundPlayer3!
                                                                              .stop();
                                                                        }
                                                                        _model
                                                                            .soundPlayer3!
                                                                            .setVolume(1.0);
                                                                        _model
                                                                            .soundPlayer3!
                                                                            .setAsset(
                                                                                'assets/audios/notification_sound.mp3')
                                                                            .then((_) =>
                                                                                _model.soundPlayer3!.play());
                                                                      } else {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'internal_error_log': FieldValue.arrayUnion([
                                                                                '${getCurrentTimestamp.toString()}Failed to retrieve message - ${(_model.aiResponseForMessage?.jsonBody ?? '').toString()}'
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                      }
                                                                    } else {
                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'internal_error_log':
                                                                                FieldValue.arrayUnion([
                                                                              '${getCurrentTimestamp.toString()}Failed to create RUN - ${(_model.createRunResponse?.jsonBody ?? '').toString()}'
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                    }
                                                                  } else {
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'internal_error_log':
                                                                              FieldValue.arrayUnion([
                                                                            '${getCurrentTimestamp.toString()}Failed to create message - ${(_model.createMessageResponse?.jsonBody ?? '').toString()}'
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text: 'Send',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 46.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    currentUserDocument
                                                                        ?.colorSendButtonBackground,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          currentUserDocument
                                                                              ?.colorSendButtonText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Powered By',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  ' - OM Chatbot',
                                                              style: TextStyle(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  currentUserDocument
                                                                      ?.colorSendButtonBackground,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12.0,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.chatbotVisiblity == true) {
                                            _model.chatbotVisiblity = false;
                                            setState(() {});
                                          } else {
                                            _model.chatbotVisiblity = true;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              currentUserDocument
                                                  ?.colorSendButtonBackground,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.chat_bubble_outline_sharp,
                                              color: valueOrDefault<Color>(
                                                currentUserDocument
                                                    ?.colorSendButtonText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ),
                              ],
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
        ));
  }
}
