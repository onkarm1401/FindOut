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

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart';

Future<List<String>?> uniqueLinks(String? url) async {
  final result = <String>[];

  if (url == null) {
    result.add('URL is null');
    return result;
  }

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      result.add('Successfully fetched the webpage');

      final document = html_parser.parse(response.body);
      final links = document.querySelectorAll('a[href]');

      final uniqueLinks = <String>{};

      for (final link in links) {
        final href = link.attributes['href'];

        if (href != null && href.isNotEmpty) {
          final absoluteUrl = Uri.parse(href).isAbsolute
              ? href
              : Uri.parse(url).resolveUri(Uri.parse(href)).toString();

          uniqueLinks.add(absoluteUrl);
        }
      }

      result.addAll(uniqueLinks);
    } else {
      result.add(
          'Failed to fetch website content. Status code: ${response.statusCode}');
    }
  } catch (e, stackTrace) {
    result.add('An error occurred: $e');
    result.add('Stack trace: $stackTrace');
  }

  return result;
}
