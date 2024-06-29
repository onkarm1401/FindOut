// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:stream_transform/stream_transform.dart';
import 'dart:html';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw; // Changed 'widget' to 'widgets'

Future<FFUploadedFile> pdfGenerator(
  String title,
  String filename,
  String message,
) async {
  final pdf = pw.Document(); // Corrected 'document' to 'Document'
  pdf.addPage(
    pw.Page(
        // Changed 'page' to 'Page'
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32), // Corrected 'Margin' to 'margin'
        build: (pw.Context context) {
          // Corrected 'Context' to 'context'
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment
                  .start, // Corrected 'CrossAxisAlignment' to 'crossAxisAlignment'
              children: [
                // Corrected 'childern' to 'children'
                pw.Text(DateTime.now().toString(),
                    style: pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 10), // Corrected 'SizeBox' to 'SizedBox'
                pw.Text(title,
                    style: pw.TextStyle(
                        fontSize:
                            24)), // Corrected 'fontsize' to 'fontSize' and added missing comma
                pw.Text(message,
                    style: pw.TextStyle(
                        fontSize: 24)), // Corrected 'fontsize' to 'fontSize'
              ]);
        }),
  );

  final pdfBytes = await pdf
      .save(); // Corrected 'UnitBlist' to 'final' and changed to correct variable type
  final uploadedFile = FFUploadedFile(
    bytes: pdfBytes,
    name: filename,
  );
  return uploadedFile; // Corrected 'uploadFile' to 'uploadedFile'
}
