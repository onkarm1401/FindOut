import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/chatbot/setting/website_data/website_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'website_infromation_fetch_model.dart';
export 'website_infromation_fetch_model.dart';

class WebsiteInfromationFetchWidget extends StatefulWidget {
  const WebsiteInfromationFetchWidget({super.key});

  @override
  State<WebsiteInfromationFetchWidget> createState() =>
      _WebsiteInfromationFetchWidgetState();
}

class _WebsiteInfromationFetchWidgetState
    extends State<WebsiteInfromationFetchWidget> {
  late WebsiteInfromationFetchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebsiteInfromationFetchModel());

    _model.textController1 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.website, ''));
    _model.textFieldFocusNode ??= FocusNode();

    _model.existingDataTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.websiteFetchedData, ''));
    _model.existingDataFocusNode ??= FocusNode();

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
                    child: wrapWithModel(
                      model: _model.sideNavModel,
                      updateCallback: () => setState(() {}),
                      child: const SideNavWidget(
                        selectedNav: 5,
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
                                      fontFamily: 'Readex Pro',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode,
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
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      width: 2.0,
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
                                                      width: 2.0,
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
                                                      width: 2.0,
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
                                                      width: 2.0,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          _model.uniqueLinks =
                                              await FetchUniqueLinksCall.call(
                                            website:
                                                _model.textController1.text,
                                          );
                                          shouldSetState = true;
                                          if ((_model.uniqueLinks?.succeeded ??
                                              true)) {
                                            await currentUserReference!.update(
                                                createUserTableRecordData(
                                              website:
                                                  _model.textController1.text,
                                            ));
                                            setState(() {
                                              _model.uniqueLinksCount = null;
                                              _model.uniqueURL = [];
                                              _model.totalIteration = 0;
                                              _model.currentIteration = 0;
                                              _model.fetchedInfo = [];
                                            });
                                            setState(() {
                                              _model.totalIteration =
                                                  FetchUniqueLinksCall
                                                      .uniquelinksCount(
                                                (_model.uniqueLinks?.jsonBody ??
                                                    ''),
                                              );
                                            });
                                            setState(() {
                                              _model.uniqueURL =
                                                  FetchUniqueLinksCall
                                                          .uniquelinks(
                                                (_model.uniqueLinks?.jsonBody ??
                                                    ''),
                                              )!
                                                      .toList()
                                                      .cast<String>();
                                            });
                                            while (
                                                _model.uniqueURL.length >= 0) {
                                              _model.uniqueLinkData =
                                                  await FetchDataCall.call(
                                                url: getJsonField(
                                                  (_model.uniqueLinks
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.unique_links[0]''',
                                                ).toString(),
                                                openaiKey:
                                                    getRemoteConfigString(
                                                        'openAI_key'),
                                              );
                                              shouldSetState = true;
                                              if ((_model.uniqueLinkData
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() {
                                                  _model.addToFetchedInfo(
                                                      FetchDataCall.outputData(
                                                    (_model.uniqueLinkData
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!);
                                                });
                                                setState(() {
                                                  _model
                                                      .removeAtIndexFromUniqueURL(
                                                          0);
                                                });
                                                setState(() {
                                                  _model.currentIteration =
                                                      _model.currentIteration! +
                                                          1;
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Failed to fetch unique link data',
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
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      (_model.uniqueLinkData
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString(),
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
                                              }
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'All the information fetched successfully.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Failed to fetch unique links',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.uniqueLinks
                                                              ?.jsonBody ??
                                                          '')
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        text: 'Fetch Information from links',
                                        options: FFButtonOptions(
                                          height: 45.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
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
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: CircularPercentIndicator(
                                            percent:
                                                (_model.currentIteration!) /
                                                    (_model.totalIteration!),
                                            radius: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.03,
                                            lineWidth: 8.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              formatNumber(
                                                ((_model.currentIteration!) /
                                                    (_model.totalIteration!)),
                                                formatType: FormatType.percent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.38,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
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
                                                      'New Data',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text: 'Discard',
                                                        options:
                                                            FFButtonOptions(
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
                                                              .info,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
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
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.getAssistentDetails =
                                                            await OpenAIAssistentGroup
                                                                .getAssistentDetailsCall
                                                                .call(
                                                          assistentId: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.openAIAssistentId,
                                                              ''),
                                                          token:
                                                              getRemoteConfigString(
                                                                  'openAI_key'),
                                                        );
                                                        if ((_model
                                                                .getAssistentDetails
                                                                ?.succeeded ??
                                                            true)) {
                                                          if ((OpenAIAssistentGroup
                                                                              .getAssistentDetailsCall
                                                                              .vectorstoreids(
                                                                            (_model.getAssistentDetails?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      (OpenAIAssistentGroup
                                                                              .getAssistentDetailsCall
                                                                              .vectorstoreids(
                                                                        (_model.getAssistentDetails?.jsonBody ??
                                                                            ''),
                                                                      ))!
                                                                          .isNotEmpty) ==
                                                                  true
                                                              ? true
                                                              : false) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Already we have file. first delete file then uplaod new one',
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
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        2000));
                                                            _model.deleteAsistentFile =
                                                                await VectorStorageGroup
                                                                    .deleteStorageFileCall
                                                                    .call(
                                                              fileId: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.uploadedFileName,
                                                                  ''),
                                                              token: getRemoteConfigString(
                                                                  'openAI_key'),
                                                            );
                                                            if ((_model
                                                                    .deleteAsistentFile
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000));
                                                              _model.deleteVectorStore =
                                                                  await VectorStorageGroup
                                                                      .deleteVectorStorageCall
                                                                      .call(
                                                                vectorStorageId:
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.vectorStoresId,
                                                                        ''),
                                                                token: getRemoteConfigString(
                                                                    'openAI_key'),
                                                              );
                                                              if ((_model
                                                                      .deleteVectorStore
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            2000));
                                                                _model.recreateVectorStore =
                                                                    await VectorStorageGroup
                                                                        .createVectorStorageCall
                                                                        .call(
                                                                  token: getRemoteConfigString(
                                                                      'openAI_key'),
                                                                );
                                                                if ((_model
                                                                        .recreateVectorStore
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1500));

                                                                  await currentUserReference!
                                                                      .update(
                                                                          createUserTableRecordData(
                                                                    vectorStoresId:
                                                                        VectorStorageGroup
                                                                            .createVectorStorageCall
                                                                            .vectorStorageId(
                                                                      (_model.recreateVectorStore
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                  ));
                                                                  _model.fileGenerationAPI =
                                                                      await GenerateAndUploadFileCall
                                                                          .call(
                                                                    filename: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.openAIAssistentId,
                                                                        ''),
                                                                    websiteData:
                                                                        functions.convertStringListToString(_model
                                                                            .fetchedInfo
                                                                            .toList()),
                                                                    faq: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.fAQData,
                                                                        ''),
                                                                    token: getRemoteConfigString(
                                                                        'openAI_key'),
                                                                  );
                                                                  if ((_model
                                                                          .fileGenerationAPI
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            2500));

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUserTableRecordData(
                                                                      uploadedFileName:
                                                                          GenerateAndUploadFileCall
                                                                              .fileId(
                                                                        (_model.fileGenerationAPI?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                    ));
                                                                    _model.addFileToVectorStorage =
                                                                        await VectorStorageGroup
                                                                            .linkUploadedFileToVectorStorageCall
                                                                            .call(
                                                                      vectorStorageId: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.vectorStoresId,
                                                                          ''),
                                                                      fileId: GenerateAndUploadFileCall
                                                                          .fileId(
                                                                        (_model.fileGenerationAPI?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      token: getRemoteConfigString(
                                                                          'openAI_key'),
                                                                    );
                                                                    if ((_model
                                                                            .addFileToVectorStorage
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              1500));
                                                                      _model.addFileToAsistent = await OpenAIAssistentGroup
                                                                          .addFileToAssistentCall
                                                                          .call(
                                                                        assistantsId: valueOrDefault(
                                                                            currentUserDocument?.openAIAssistentId,
                                                                            ''),
                                                                        instructions: valueOrDefault(
                                                                            currentUserDocument?.chatbotInstruction,
                                                                            ''),
                                                                        chatbotName: valueOrDefault(
                                                                            currentUserDocument?.chatbotName,
                                                                            ''),
                                                                        vectorStoreIds: valueOrDefault(
                                                                            currentUserDocument?.vectorStoresId,
                                                                            ''),
                                                                        token: getRemoteConfigString(
                                                                            'openAI_key'),
                                                                      );
                                                                      if ((_model
                                                                              .addFileToAsistent
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                1000));
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Data is successfully uploaded to assistent.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                        // Data is saved to backend

                                                                        await currentUserReference!
                                                                            .update(createUserTableRecordData(
                                                                          website: _model
                                                                              .textController1
                                                                              .text,
                                                                          websiteFetchedData: functions.convertStringListToString(_model
                                                                              .fetchedInfo
                                                                              .toList()),
                                                                        ));
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Failed to add file to asistnet',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              (_model.addFileToAsistent?.jsonBody ?? '').toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Failed to link file to vector store',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            (_model.addFileToVectorStorage?.jsonBody ?? '').toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Failed to generate file',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.fileGenerationAPI?.jsonBody ?? '')
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Failed to re-create vector store',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.recreateVectorStore?.jsonBody ??
                                                                                '')
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Failed to delete vector store',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      (_model.deleteVectorStore?.jsonBody ??
                                                                              '')
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Failed to delete existing file',
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
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.deleteAsistentFile?.jsonBody ??
                                                                            '')
                                                                        .toString(),
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
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'False - Dont have existing file',
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
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  (OpenAIAssistentGroup.getAssistentDetailsCall.vectorstoreids(
                                                                                (_model.getAssistentDetails?.jsonBody ?? ''),
                                                                              ) !=
                                                                              null &&
                                                                          (OpenAIAssistentGroup.getAssistentDetailsCall.vectorstoreids(
                                                                            (_model.getAssistentDetails?.jsonBody ??
                                                                                ''),
                                                                          ))!
                                                                              .isNotEmpty)
                                                                      .toString(),
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
                                                            _model.fileGeneration =
                                                                await GenerateAndUploadFileCall
                                                                    .call(
                                                              token: getRemoteConfigString(
                                                                  'openAI_key'),
                                                              faq:
                                                                  valueOrDefault<
                                                                      String>(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.fAQData,
                                                                    ''),
                                                                'N/A',
                                                              ),
                                                              filename: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.openAIAssistentId,
                                                                  ''),
                                                              websiteData: functions
                                                                  .convertStringListToString(_model
                                                                      .fetchedInfo
                                                                      .toList()),
                                                            );
                                                            if ((_model
                                                                    .fileGeneration
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await currentUserReference!
                                                                  .update(
                                                                      createUserTableRecordData(
                                                                uploadedFileName:
                                                                    GenerateAndUploadFileCall
                                                                        .fileId(
                                                                  (_model.fileGeneration
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                              ));
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
                                                                token: getRemoteConfigString(
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
                                                                  assistantsId:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.openAIAssistentId,
                                                                          ''),
                                                                  instructions:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chatbotInstruction,
                                                                          ''),
                                                                  chatbotName:
                                                                      getRemoteConfigString(
                                                                          'openAI_key'),
                                                                  vectorStoreIds:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.vectorStoresId,
                                                                          ''),
                                                                  token: getRemoteConfigString(
                                                                      'openAI_key'),
                                                                );
                                                                if ((_model
                                                                        .addVectorStorageToAssisent
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Data is successfully uploaded.',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  // Data is saved to backend

                                                                  await currentUserReference!
                                                                      .update(
                                                                          createUserTableRecordData(
                                                                    website: _model
                                                                        .textController1
                                                                        .text,
                                                                    websiteFetchedData:
                                                                        functions.convertStringListToString(_model
                                                                            .fetchedInfo
                                                                            .toList()),
                                                                  ));
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Failed to link vector storage to asistent.',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.addVectorStorageToAssisent?.jsonBody ??
                                                                                '')
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Failed to link uploaded file to vector storage',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      (_model.linkFIleToVectorStorage?.jsonBody ??
                                                                              '')
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Failed to generate file',
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
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.fileGeneration?.jsonBody ??
                                                                            '')
                                                                        .toString(),
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
                                                            }
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'Save Data',
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
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 16.0)),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final test =
                                                    _model.fetchedInfo.toList();
                                                return ListView.separated(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 16.0),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: test.length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(height: 16.0),
                                                  itemBuilder:
                                                      (context, testIndex) {
                                                    final testItem =
                                                        test[testIndex];
                                                    return Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: WebsiteDataWidget(
                                                        key: Key(
                                                            'Keyfkm_${testIndex}_of_${test.length}'),
                                                        parameter1: testItem,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 38.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        'Existing Data',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Discard'),
                                                                          content:
                                                                              const Text('Are you sure to discard changes'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              setState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.website,
                                                                        '');
                                                              });
                                                            }
                                                          },
                                                          text: 'Discard',
                                                          options:
                                                              FFButtonOptions(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
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
                                                                .info,
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
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
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
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          // Data is saved to backend

                                                          await currentUserReference!
                                                              .update(
                                                                  createUserTableRecordData(
                                                            website: _model
                                                                .textController1
                                                                .text,
                                                          ));
                                                          _model.mGetAssistentDetails =
                                                              await OpenAIAssistentGroup
                                                                  .getAssistentDetailsCall
                                                                  .call(
                                                            assistentId: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.openAIAssistentId,
                                                                ''),
                                                            token:
                                                                getRemoteConfigString(
                                                                    'openAI_key'),
                                                          );
                                                          if ((_model
                                                                  .mGetAssistentDetails
                                                                  ?.succeeded ??
                                                              true)) {
                                                            if ((OpenAIAssistentGroup.getAssistentDetailsCall.vectorstoreids(
                                                                              (_model.mGetAssistentDetails?.jsonBody ?? ''),
                                                                            ) !=
                                                                            null &&
                                                                        (OpenAIAssistentGroup.getAssistentDetailsCall.vectorstoreids(
                                                                          (_model.mGetAssistentDetails?.jsonBody ??
                                                                              ''),
                                                                        ))!
                                                                            .isNotEmpty) ==
                                                                    true
                                                                ? true
                                                                : false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Already we have file. first delete file then uplaod new one',
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
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000));
                                                              _model.mDeleteAsistentFile =
                                                                  await VectorStorageGroup
                                                                      .deleteStorageFileCall
                                                                      .call(
                                                                fileId: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.uploadedFileName,
                                                                    ''),
                                                                token: getRemoteConfigString(
                                                                    'openAI_key'),
                                                              );
                                                              if ((_model
                                                                      .mDeleteAsistentFile
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            2000));
                                                                _model.mDeleteVectorStore =
                                                                    await VectorStorageGroup
                                                                        .deleteVectorStorageCall
                                                                        .call(
                                                                  vectorStorageId:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.vectorStoresId,
                                                                          ''),
                                                                  token: getRemoteConfigString(
                                                                      'openAI_key'),
                                                                );
                                                                if ((_model
                                                                        .mDeleteVectorStore
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              2000));
                                                                  _model.mRecreateVectorStore =
                                                                      await VectorStorageGroup
                                                                          .createVectorStorageCall
                                                                          .call(
                                                                    token: getRemoteConfigString(
                                                                        'openAI_key'),
                                                                  );
                                                                  if ((_model
                                                                          .mRecreateVectorStore
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            1500));

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUserTableRecordData(
                                                                      vectorStoresId: VectorStorageGroup
                                                                          .createVectorStorageCall
                                                                          .vectorStorageId(
                                                                        (_model.mRecreateVectorStore?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                    ));
                                                                    _model.mFileGenerationAPI =
                                                                        await GenerateAndUploadFileCall
                                                                            .call(
                                                                      filename: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.openAIAssistentId,
                                                                          ''),
                                                                      websiteData: functions.convertToOneline(_model
                                                                          .existingDataTextController
                                                                          .text),
                                                                      faq: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.fAQData,
                                                                          ''),
                                                                      token: getRemoteConfigString(
                                                                          'openAI_key'),
                                                                    );
                                                                    if ((_model
                                                                            .mFileGenerationAPI
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              2500));

                                                                      await currentUserReference!
                                                                          .update(
                                                                              createUserTableRecordData(
                                                                        uploadedFileName:
                                                                            GenerateAndUploadFileCall.fileId(
                                                                          (_model.mFileGenerationAPI?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                      ));
                                                                      _model.mAddFileToVectorStorage = await VectorStorageGroup
                                                                          .linkUploadedFileToVectorStorageCall
                                                                          .call(
                                                                        vectorStorageId: valueOrDefault(
                                                                            currentUserDocument?.vectorStoresId,
                                                                            ''),
                                                                        fileId:
                                                                            GenerateAndUploadFileCall.fileId(
                                                                          (_model.mFileGenerationAPI?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        token: getRemoteConfigString(
                                                                            'openAI_key'),
                                                                      );
                                                                      if ((_model
                                                                              .mAddFileToVectorStorage
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        await Future.delayed(const Duration(
                                                                            milliseconds:
                                                                                1500));
                                                                        _model.mAddFileToAsistent = await OpenAIAssistentGroup
                                                                            .addFileToAssistentCall
                                                                            .call(
                                                                          assistantsId: valueOrDefault(
                                                                              currentUserDocument?.openAIAssistentId,
                                                                              ''),
                                                                          instructions: valueOrDefault(
                                                                              currentUserDocument?.chatbotInstruction,
                                                                              ''),
                                                                          chatbotName: valueOrDefault(
                                                                              currentUserDocument?.chatbotName,
                                                                              ''),
                                                                          vectorStoreIds: valueOrDefault(
                                                                              currentUserDocument?.vectorStoresId,
                                                                              ''),
                                                                          token:
                                                                              getRemoteConfigString('openAI_key'),
                                                                        );
                                                                        if ((_model.mAddFileToAsistent?.succeeded ??
                                                                            true)) {
                                                                          await Future.delayed(
                                                                              const Duration(milliseconds: 1000));
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Data is successfully uploaded to assistent.',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: const Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );

                                                                          await currentUserReference!
                                                                              .update(createUserTableRecordData(
                                                                            websiteFetchedData:
                                                                                _model.existingDataTextController.text,
                                                                          ));
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Failed to add file to asistnet',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: const Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                (_model.mAddFileToAsistent?.jsonBody ?? '').toString(),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: const Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        }
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Failed to link file to vector store',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              (_model.mAddFileToVectorStorage?.jsonBody ?? '').toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Failed to generate file',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            (_model.mFileGenerationAPI?.jsonBody ?? '').toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Failed to re-create vector store',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.mRecreateVectorStore?.jsonBody ?? '')
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Failed to delete vector store',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.mDeleteVectorStore?.jsonBody ??
                                                                                '')
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Failed to delete existing file',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      (_model.mDeleteAsistentFile?.jsonBody ??
                                                                              '')
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'False - Dont have existing file',
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
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (OpenAIAssistentGroup.getAssistentDetailsCall.vectorstoreids(
                                                                                  (_model.mGetAssistentDetails?.jsonBody ?? ''),
                                                                                ) !=
                                                                                null &&
                                                                            (OpenAIAssistentGroup.getAssistentDetailsCall.vectorstoreids(
                                                                              (_model.mGetAssistentDetails?.jsonBody ?? ''),
                                                                            ))!
                                                                                .isNotEmpty)
                                                                        .toString(),
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
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000));
                                                              _model.mFileGeneration =
                                                                  await GenerateAndUploadFileCall
                                                                      .call(
                                                                token: getRemoteConfigString(
                                                                    'openAI_key'),
                                                                faq: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.fAQData,
                                                                    ''),
                                                                filename: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.uploadedFileName,
                                                                    ''),
                                                                websiteData: functions
                                                                    .convertToOneline(_model
                                                                        .existingDataTextController
                                                                        .text),
                                                              );
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.mFileGeneration
                                                                            ?.bodyText ??
                                                                        ''),
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
                                                              if ((_model
                                                                      .mFileGeneration
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                await currentUserReference!
                                                                    .update(
                                                                        createUserTableRecordData(
                                                                  uploadedFileName:
                                                                      GenerateAndUploadFileCall
                                                                          .fileId(
                                                                    (_model.mFileGeneration
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                ));
                                                                _model.mLinkFIleToVectorStorage =
                                                                    await VectorStorageGroup
                                                                        .linkUploadedFileToVectorStorageCall
                                                                        .call(
                                                                  vectorStorageId:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.vectorStoresId,
                                                                          ''),
                                                                  fileId: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.uploadedFileName,
                                                                      ''),
                                                                  token: getRemoteConfigString(
                                                                      'openAI_key'),
                                                                );
                                                                if ((_model
                                                                        .mLinkFIleToVectorStorage
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model.mAddVectorStorageToAssisent =
                                                                      await OpenAIAssistentGroup
                                                                          .addFileToAssistentCall
                                                                          .call(
                                                                    assistantsId:
                                                                        valueOrDefault(
                                                                            currentUserDocument?.openAIAssistentId,
                                                                            ''),
                                                                    instructions:
                                                                        valueOrDefault(
                                                                            currentUserDocument?.chatbotInstruction,
                                                                            ''),
                                                                    chatbotName:
                                                                        valueOrDefault(
                                                                            currentUserDocument?.chatbotName,
                                                                            ''),
                                                                    vectorStoreIds:
                                                                        valueOrDefault(
                                                                            currentUserDocument?.vectorStoresId,
                                                                            ''),
                                                                    token: getRemoteConfigString(
                                                                        'openAI_key'),
                                                                  );
                                                                  if ((_model
                                                                          .mAddVectorStorageToAssisent
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Data is successfully uploaded.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUserTableRecordData(
                                                                      websiteFetchedData: _model
                                                                          .existingDataTextController
                                                                          .text,
                                                                    ));
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Failed to link vector storage to asistent.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.mAddVectorStorageToAssisent?.jsonBody ?? '')
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Failed to link uploaded file to vector storage',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.mLinkFIleToVectorStorage?.jsonBody ??
                                                                                '')
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Failed to generate file',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      (_model.mFileGeneration?.jsonBody ??
                                                                              '')
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          }

                                                          setState(() {});
                                                        },
                                                        text: 'Modify & Update',
                                                        options:
                                                            FFButtonOptions(
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
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
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
                                                  ].divide(
                                                      const SizedBox(width: 16.0)),
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            TextFormField(
                                                          controller: _model
                                                              .existingDataTextController,
                                                          focusNode: _model
                                                              .existingDataFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Data',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
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
                                                                width: 2.0,
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
                                                                    .primary,
                                                                width: 2.0,
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
                                                                width: 2.0,
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
                                                                width: 2.0,
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
                                                          maxLines: null,
                                                          validator: _model
                                                              .existingDataTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 16.0)),
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
    );
  }
}
