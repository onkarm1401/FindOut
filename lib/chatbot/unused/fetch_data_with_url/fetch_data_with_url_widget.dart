import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fetch_data_with_url_model.dart';
export 'fetch_data_with_url_model.dart';

class FetchDataWithUrlWidget extends StatefulWidget {
  const FetchDataWithUrlWidget({super.key});

  @override
  State<FetchDataWithUrlWidget> createState() => _FetchDataWithUrlWidgetState();
}

class _FetchDataWithUrlWidgetState extends State<FetchDataWithUrlWidget> {
  late FetchDataWithUrlModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FetchDataWithUrlModel());

    _model.textController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      valueOrDefault(currentUserDocument?.website, ''),
      'Enter Website',
    ));
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: functions.convertStringListToString(_model.ouputData.toList()));
    _model.textFieldFocusNode2 ??= FocusNode();

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
        title: 'fetch-data-with-url',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.apiResultwlo = await VectorStorageGroup
                                .listOfUploadedFileCall
                                .call(
                              vsId: valueOrDefault(
                                  currentUserDocument?.vectorStoresId, ''),
                              token: getRemoteConfigString('openAI_key'),
                            );

                            if ((_model.apiResultwlo?.succeeded ?? true)) {
                              await currentUserReference!
                                  .update(createUserTableRecordData(
                                usedStorageFile: functions.calculateListValue(
                                    VectorStorageGroup.listOfUploadedFileCall
                                        .usagebytes(
                                          (_model.apiResultwlo?.jsonBody ?? ''),
                                        )!
                                        .toList()),
                              ));
                            }

                            setState(() {});
                          },
                          child: wrapWithModel(
                            model: _model.sideNavModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: const SideNavWidget(
                              selectedNav: 1,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fetch Website Data',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 18.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Enter website to fetch data',
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
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
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
                                                          width: 2.0,
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
                                                          width: 2.0,
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
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                        .textController1Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var shouldSetState = false;
                                              _model.uniqueLinks =
                                                  await FetchUniqueLinksCall
                                                      .call(
                                                website:
                                                    _model.textController1.text,
                                              );

                                              shouldSetState = true;
                                              if ((_model
                                                      .uniqueLinks?.succeeded ??
                                                  true)) {
                                                await currentUserReference!
                                                    .update(
                                                        createUserTableRecordData(
                                                  website: _model
                                                      .textController1.text,
                                                ));
                                                _model.uniqueLinksCount = 0;
                                                _model.uniqueURL = [
                                                  'Hello World'
                                                ];
                                                _model.totalIteration = 0;
                                                _model.currentIteration = 0;
                                                _model.ouputData = [];
                                                _model.selectedURL = [];
                                                setState(() {});
                                                _model.uniqueURL =
                                                    FetchUniqueLinksCall
                                                            .uniquelinks(
                                                  (_model.uniqueLinks
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                _model.uniqueLinkFlag = false;
                                                setState(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Failed to fetch data.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
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

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Fetch Website Links',
                                            options: FFButtonOptions(
                                              height: 45.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
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
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.uniqueLinkFlag != true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Website Links',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed:
                                                        (_model.selectedURL.isEmpty)
                                                            ? null
                                                            : () async {
                                                                _model.totalIteration =
                                                                    valueOrDefault<
                                                                        int>(
                                                                  _model
                                                                      .selectedURL
                                                                      .length,
                                                                  0,
                                                                );
                                                                _model.selectedURL = _model
                                                                    .checkboxGroupValues!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                                _model.dataFlag =
                                                                    false;
                                                                setState(() {});
                                                                while (_model
                                                                        .uniqueURL
                                                                        .length >=
                                                                    0) {
                                                                  _model.uniqueLinkDataCopy =
                                                                      await FetchDataCall
                                                                          .call(
                                                                    url: _model
                                                                        .checkboxGroupValues?[0],
                                                                    openaiKey:
                                                                        getRemoteConfigString(
                                                                            'openAI_key'),
                                                                  );

                                                                  if ((_model
                                                                          .uniqueLinkDataCopy
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model
                                                                        .removeAtIndexFromSelectedURL(
                                                                            0);
                                                                    setState(
                                                                        () {});
                                                                    _model.currentIteration =
                                                                        _model.currentIteration! +
                                                                            1;
                                                                    setState(
                                                                        () {});
                                                                    _model.formatedData =
                                                                        await OpenAICall
                                                                            .call(
                                                                      instructions:
                                                                          'Convert input data into meaningful sentence. Return only formated data. Make sure that data will not lost',
                                                                      inputData:
                                                                          functions
                                                                              .convertToOneline(FetchDataCall.outputData(
                                                                        (_model.uniqueLinkDataCopy?.jsonBody ??
                                                                            ''),
                                                                      )!),
                                                                      token: getRemoteConfigString(
                                                                          'openAI_key'),
                                                                    );

                                                                    if ((_model
                                                                            .formatedData
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.addToOuputData(
                                                                          OpenAICall
                                                                              .content(
                                                                        (_model.formatedData?.jsonBody ??
                                                                            ''),
                                                                      )!);
                                                                      setState(
                                                                          () {});
                                                                      unawaited(
                                                                        () async {
                                                                          await currentUserReference!
                                                                              .update({
                                                                            ...createUserTableRecordData(
                                                                              displayName: functions.convertStringListToString(_model.ouputData.toList()),
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'used_token': FieldValue.increment(OpenAICall.totalToken(
                                                                                  (_model.formatedData?.jsonBody ?? ''),
                                                                                )!),
                                                                              },
                                                                            ),
                                                                          });
                                                                        }(),
                                                                      );
                                                                    }
                                                                  }
                                                                  setState(() {
                                                                    _model.textController2
                                                                            ?.text =
                                                                        functions.convertStringListToString(_model
                                                                            .ouputData
                                                                            .toList())!;
                                                                    _model.textController2?.selection = TextSelection.collapsed(
                                                                        offset: _model
                                                                            .textController2!
                                                                            .text
                                                                            .length);
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                    text:
                                                        'Fetch Data From Link',
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
                                                      disabledColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 16.0)),
                                              ),
                                            ),
                                          if (_model.uniqueLinkFlag != true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: FlutterFlowCheckboxGroup(
                                                options:
                                                    _model.uniqueURL.toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .checkboxGroupValues =
                                                      val);
                                                  _model.selectedURL = _model
                                                      .checkboxGroupValues!
                                                      .toList()
                                                      .cast<String>();
                                                  setState(() {});
                                                },
                                                controller: _model
                                                        .checkboxGroupValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                checkboxBorderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                checkboxBorderRadius:
                                                    BorderRadius.circular(4.0),
                                                initialized: _model
                                                        .checkboxGroupValues !=
                                                    null,
                                              ),
                                            ),
                                          if (_model.dataFlag != true)
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          if (_model.dataFlag != true)
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    _model.fileGeneration =
                                                        await GenerateAndUploadFileCall
                                                            .call(
                                                      token:
                                                          getRemoteConfigString(
                                                              'openAI_key'),
                                                      faq: '',
                                                      filename:
                                                          'WebsiteDate-${getCurrentTimestamp.toString()}',
                                                      websiteData: functions
                                                          .convertStringListToString(
                                                              _model.ouputData
                                                                  .toList()),
                                                    );

                                                    if ((_model.fileGeneration
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.linkFIleToVectorStorage =
                                                          await VectorStorageGroup
                                                              .linkUploadedFileToVectorStorageCall
                                                              .call(
                                                        vectorStorageId:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.vectorStoresId,
                                                                ''),
                                                        fileId:
                                                            GenerateAndUploadFileCall
                                                                .fileId(
                                                          (_model.fileGeneration
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        token:
                                                            getRemoteConfigString(
                                                                'openAI_key'),
                                                      );

                                                      if ((_model
                                                              .linkFIleToVectorStorage
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.addVectorStorageToAssisent =
                                                            await OpenAIAssistentGroup
                                                                .addFileToAssistentCall
                                                                .call(
                                                          assistantsId: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.openAIAssistentId,
                                                              ''),
                                                          instructions:
                                                              '${functions.convertToOneline(getRemoteConfigString('default_instruction'))}${valueOrDefault(currentUserDocument?.userInstruction, '')}',
                                                          chatbotName: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.chatbotName,
                                                              ''),
                                                          vectorStoreIds:
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.vectorStoresId,
                                                                  ''),
                                                          token:
                                                              getRemoteConfigString(
                                                                  'openAI_key'),
                                                        );

                                                        if ((_model
                                                                .addVectorStorageToAssisent
                                                                ?.succeeded ??
                                                            true)) {
                                                          // Data is saved to backend

                                                          await currentUserReference!
                                                              .update(
                                                                  createUserTableRecordData(
                                                            website: _model
                                                                .textController1
                                                                .text,
                                                            websiteFetchedData:
                                                                functions.convertStringListToString(
                                                                    _model
                                                                        .ouputData
                                                                        .toList()),
                                                          ));
                                                          unawaited(
                                                            () async {
                                                              await StorageUsagesRecord
                                                                  .collection
                                                                  .doc(
                                                                      currentUserReference!
                                                                          .id)
                                                                  .set(
                                                                      createStorageUsagesRecordData(
                                                                    userID:
                                                                        currentUserUid,
                                                                    filename:
                                                                        GenerateAndUploadFileCall
                                                                            .filename(
                                                                      (_model.fileGeneration
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    fileID: GenerateAndUploadFileCall
                                                                        .fileId(
                                                                      (_model.fileGeneration
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    uploadedDate:
                                                                        getCurrentTimestamp,
                                                                    billStartedDate:
                                                                        getCurrentTimestamp,
                                                                    fileSize:
                                                                        GenerateAndUploadFileCall
                                                                            .byte(
                                                                      (_model.fileGeneration
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                  ));
                                                            }(),
                                                          );
                                                          _model.apiResultwlo2 =
                                                              await VectorStorageGroup
                                                                  .listOfUploadedFileCall
                                                                  .call(
                                                            vsId: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.vectorStoresId,
                                                                ''),
                                                            token:
                                                                getRemoteConfigString(
                                                                    'openAI_key'),
                                                          );

                                                          if ((_model
                                                                  .apiResultwlo2
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await currentUserReference!
                                                                .update(
                                                                    createUserTableRecordData(
                                                              usedStorageFile: functions.calculateListValue(
                                                                  VectorStorageGroup
                                                                      .listOfUploadedFileCall
                                                                      .usagebytes(
                                                                        (_model.apiResultwlo2?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()),
                                                            ));
                                                          }
                                                        }
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Failed to upload data',
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
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Upload Information',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
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
                                            ),
                                          if (_model.dataFlag != true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 14.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                autofocus: false,
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                minLines: 20,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 16.0))
                                    .around(const SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
