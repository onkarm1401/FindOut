import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_asistent_model.dart';
export 'create_asistent_model.dart';

class CreateAsistentWidget extends StatefulWidget {
  const CreateAsistentWidget({super.key});

  @override
  State<CreateAsistentWidget> createState() => _CreateAsistentWidgetState();
}

class _CreateAsistentWidgetState extends State<CreateAsistentWidget> {
  late CreateAsistentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAsistentModel());

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
        title: 'createAsistent',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).info,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.createAssistentResponse =
                                await OpenAIAssistentGroup.createAssistentCall
                                    .call(
                              token: getRemoteConfigString('openAI_key'),
                              instruction:
                                  functions.convertToOneline(getRemoteConfigString('default_instruction')),
                              chatbotName: currentUserReference?.id,
                              model: getRemoteConfigString('model'),
                            );

                            if ((_model.createAssistentResponse?.succeeded ??
                                true)) {
                              await currentUserReference!
                                  .update(createUserTableRecordData(
                                openAIAssistentId: OpenAIAssistentGroup
                                    .createAssistentCall
                                    .assistentid(
                                  (_model.createAssistentResponse?.jsonBody ??
                                      ''),
                                ),
                                chatbotName: 'Chatbot',
                              ));
                              _model.createVectorStorage =
                                  await VectorStorageGroup
                                      .createVectorStorageCall
                                      .call(
                                token: getRemoteConfigString('openAI_key'),
                              );

                              if ((_model.createVectorStorage?.succeeded ??
                                  true)) {
                                await currentUserReference!
                                    .update(createUserTableRecordData(
                                  vectorStoresId: VectorStorageGroup
                                      .createVectorStorageCall
                                      .vectorStorageId(
                                    (_model.createVectorStorage?.jsonBody ??
                                        ''),
                                  ),
                                ));
                                _model.linkVectorStoreToAsistent =
                                    await OpenAIAssistentGroup
                                        .addFileToAssistentCall
                                        .call(
                                  assistantsId: valueOrDefault(
                                      currentUserDocument?.openAIAssistentId,
                                      ''),
                                  instructions: valueOrDefault(
                                      currentUserDocument?.chatbotInstruction,
                                      ''),
                                  chatbotName: valueOrDefault(
                                      currentUserDocument?.chatbotName, ''),
                                  vectorStoreIds: VectorStorageGroup
                                      .createVectorStorageCall
                                      .vectorStorageId(
                                    (_model.createVectorStorage?.jsonBody ??
                                        ''),
                                  ),
                                  token: getRemoteConfigString('openAI_key'),
                                );

                                if ((_model
                                        .linkVectorStoreToAsistent?.succeeded ??
                                    true)) {
                                  context.pushNamed(
                                    'overview',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Failed to create',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: 'Create Assistent',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.07,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'overview',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: 'Back',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
