import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      if (valueOrDefault(currentUserDocument?.openAIAssistentId, '') == ''
          ? false
          : true) {
        _model.apiThreadResult =
            await OpenAIAssistentGroup.createThreadCall.call(
          token: getRemoteConfigString('openAI_key'),
        );
        if ((_model.apiThreadResult?.succeeded ?? true)) {
          setState(() {
            _model.threadId = OpenAIAssistentGroup.createThreadCall.threadId(
              (_model.apiThreadResult?.jsonBody ?? ''),
            );
            _model.addToChatHistory(ContentStruct(
              text: TextStruct(
                value: valueOrDefault(
                    currentUserDocument?.welcomeMessageForVisitor, ''),
              ),
            ));
          });
        } else {
          setState(() {
            _model.addToLogs('Failed to create thread');
          });
          setState(() {
            _model
                .addToLogs((_model.apiThreadResult?.jsonBody ?? '').toString());
          });
        }
      } else {
        context.pushNamed('createAsistent');
      }
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        endDrawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Drawer(
            elevation: 16.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Close',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _model.logs = [];
                          });
                        },
                        text: 'Clear logs',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).info,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final log = _model.logs.toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: log.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                        itemBuilder: (context, logIndex) {
                          final logItem = log[logIndex];
                          return Text(
                            logItem,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          );
                        },
                        controller: _model.listViewController2,
                      );
                    },
                  ),
                ].divide(const SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: const SideNavWidget(
                  selectedNav: 2,
                ),
              ),
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (_model.chatbotVisiblity == true)
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 12.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.35,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    currentUserDocument
                                                        ?.colorChatbotHeader,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.chatbotLogo,
                                                                      ''),
                                                                  fit: BoxFit
                                                                      .contain,
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
                                                          child: Container(
                                                            width: 48.0,
                                                            height: 48.0,
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
                                                              imageUrl: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.chatbotLogo,
                                                                  ''),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
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
                                                                child: Text(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.chatbotName,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          currentUserDocument
                                                                              ?.colorHeaderTextColor,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                        ),
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.chatbotDescripation,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          currentUserDocument
                                                                              ?.colorHeaderTextColor,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
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
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final chat = _model
                                                          .chatHistory
                                                          .toList();
                                                      return ListView.separated(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                                vertical: 12.0),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: chat.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 12.0),
                                                        itemBuilder: (context,
                                                            chatIndex) {
                                                          final chatItem =
                                                              chat[chatIndex];
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
                                                                      MainAxisSize
                                                                          .max,
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
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Container(
                                                                          width:
                                                                              32.0,
                                                                          height:
                                                                              32.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault(currentUserDocument?.chatbotLogo, ''),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.26,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              minHeight: MediaQuery.sizeOf(context).height * 0.06,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: valueOrDefault<Color>(
                                                                                currentUserDocument?.colorChatbotMessageBackground,
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(8.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                child: Text(
                                                                                  chatItem.text.value,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: valueOrDefault<Color>(
                                                                                          currentUserDocument?.colorChatbotMessageText,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              if ((int index) {
                                                                return index %
                                                                        2 !=
                                                                    0;
                                                              }(chatIndex))
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.26,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            minHeight:
                                                                                MediaQuery.sizeOf(context).height * 0.06,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              currentUserDocument?.colorUserMessageBackground,
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(8.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                              child: Text(
                                                                                chatItem.text.value,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: valueOrDefault<Color>(
                                                                                        currentUserDocument?.colorUserMessageText,
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Container(
                                                                          width:
                                                                              32.0,
                                                                          height:
                                                                              32.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault(currentUserDocument?.userLogo, ''),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                            ].divide(const SizedBox(
                                                                height: 14.0)),
                                                          );
                                                        },
                                                        controller: _model
                                                            .listViewController1,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                            builder: (context) =>
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController,
                                                              focusNode: _model
                                                                  .textFieldFocusNode,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
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
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
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
                                                          onPressed: () async {
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
                                                            if ((_model
                                                                    .createMessageResponse
                                                                    ?.succeeded ??
                                                                true)) {
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
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                              });
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          500));
                                                              await _model
                                                                  .listViewController1
                                                                  ?.animateTo(
                                                                _model
                                                                    .listViewController1!
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        100),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                              _model.createRunResponse =
                                                                  await OpenAIAssistentGroup
                                                                      .createRunCall
                                                                      .call(
                                                                threadId: _model
                                                                    .threadId,
                                                                assistantId:
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.openAIAssistentId,
                                                                        ''),
                                                                token: getRemoteConfigString(
                                                                    'openAI_key'),
                                                              );
                                                              if ((_model
                                                                      .createRunResponse
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
                                                                while (_model
                                                                        .status !=
                                                                    'completed') {
                                                                  _model.runRetriveResponse =
                                                                      await OpenAIAssistentGroup
                                                                          .retriveRunCall
                                                                          .call(
                                                                    threadId: _model
                                                                        .threadId,
                                                                    runId: _model
                                                                        .runId,
                                                                    token: getRemoteConfigString(
                                                                        'openAI_key'),
                                                                  );
                                                                  if ((_model
                                                                          .runRetriveResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    setState(
                                                                        () {
                                                                      _model.status = OpenAIAssistentGroup
                                                                          .retriveRunCall
                                                                          .status(
                                                                        (_model.runRetriveResponse?.jsonBody ??
                                                                            ''),
                                                                      );
                                                                    });
                                                                    if (_model
                                                                            .status !=
                                                                        'completed') {
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              2000));
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        _model.addToLogs(
                                                                            'Failed while wainting for reponse');
                                                                      });
                                                                    }
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      _model.addToLogs(
                                                                          'Failed  to retrieve data');
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.addToLogs((_model.runRetriveResponse?.jsonBody ??
                                                                              '')
                                                                          .toString());
                                                                    });
                                                                  }
                                                                }
                                                                _model.aiResponseForMessage =
                                                                    await OpenAIAssistentGroup
                                                                        .messageCall
                                                                        .call(
                                                                  threadId: _model
                                                                      .threadId,
                                                                  token: getRemoteConfigString(
                                                                      'openAI_key'),
                                                                );
                                                                if ((_model
                                                                        .aiResponseForMessage
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    _model.addToChatHistory(ContentStruct.maybeFromMap(
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
                                                                      .listViewController1
                                                                      ?.animateTo(
                                                                    _model
                                                                        .listViewController1!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  setState(() {
                                                                    _model.status =
                                                                        '';
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    _model.addToLogs(
                                                                        'Failed  to create message');
                                                                  });
                                                                  setState(() {
                                                                    _model.addToLogs(
                                                                        (_model.aiResponseForMessage?.jsonBody ??
                                                                                '')
                                                                            .toString());
                                                                  });
                                                                }
                                                              } else {
                                                                setState(() {
                                                                  _model.addToLogs(
                                                                      'Failed to create run');
                                                                });
                                                                setState(() {
                                                                  _model.addToLogs(
                                                                      (_model.createRunResponse?.jsonBody ??
                                                                              '')
                                                                          .toString());
                                                                });
                                                              }
                                                            } else {
                                                              setState(() {
                                                                _model.addToLogs(
                                                                    'Failed to create thread');
                                                              });
                                                              setState(() {
                                                                _model
                                                                    .addToLogs(
                                                                        '');
                                                              });
                                                              setState(() {
                                                                _model.addToLogs(
                                                                    (_model.createMessageResponse?.jsonBody ??
                                                                            '')
                                                                        .toString());
                                                              });
                                                            }

                                                            setState(() {});
                                                          },
                                                          text: 'Send',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 46.0,
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
                                                                valueOrDefault<
                                                                    Color>(
                                                              currentUserDocument
                                                                  ?.colorSendButtonBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        currentUserDocument
                                                                            ?.colorSendButtonText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 3.0,
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
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 6.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Powered By',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
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
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: ' - OM Chatbot',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
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
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.chatbotVisiblity == true) {
                                    setState(() {
                                      _model.chatbotVisiblity = false;
                                    });
                                  } else {
                                    setState(() {
                                      _model.chatbotVisiblity = true;
                                    });
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.05,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.05,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent2,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.chat_bubble_outline_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 18.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    text: 'Logs',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
