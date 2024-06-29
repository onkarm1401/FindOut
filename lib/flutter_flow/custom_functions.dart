import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertStringListToString(List<String>? input) {
  // cnvert string list to string
  if (input == null || input.isEmpty) {
    return null;
  }
  return input.join(', ');
}

String convertToOneline(String input) {
  // write function to convert input string to oneline data format
  String onelineData = input
      .replaceAllMapped(RegExp(r'[^a-zA-Z0-9.]'), (match) => ' ')
      .trim()
      .replaceAll(RegExp(r'\s+'), ' ');

  // return oneline data
  return onelineData;
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

double calculateListValue(List<int> data) {
  // calculate all integer values present in list and return in interger format
  int sum = 0;
  for (int i in data) {
    sum += i;
  }
  return sum.toDouble();
}

List<String>? stringToStringList(
  String? q1,
  String? q2,
  String? q3,
) {
  // convert all input item into list and return in list format
  List<String> list = [];
  if (q1 != null) {
    list.add(q1);
  }
  if (q2 != null) {
    list.add(q2);
  }
  if (q3 != null) {
    list.add(q3);
  }
  return list.isEmpty ? null : list;
}

DateTime? expiryDateGenerator(int? days) {
  // add input days in todays date and return date
  DateTime today = DateTime.now();
  if (days != null) {
    return today.add(Duration(days: days));
  } else {
    return null;
  }
}

DateTime? firstDate() {
  // write code to generate first date-time of current month
  return DateTime(DateTime.now().year, DateTime.now().month, 1);
}

String? convertJSONtoString(dynamic input) {
  // convert json format to string format
  return json.encode(input);
}

String? generateJSONReturnString(dynamic json) {
  // generate JSON convert TO String
  try {
    final jsonString = jsonEncode(json);
    return jsonString;
  } catch (e) {
    print('Error generating JSON string: $e');
    return null;
  }
}

String? jsonToString(String? ip) {
  // write code to replace ('"', '\\"') for all places
  if (ip == null) return null;
  return ip.replaceAll('"', '\\"');
}
