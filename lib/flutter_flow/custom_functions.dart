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

String? convertStringListToString(List<String>? inputData) {
  // Generate a function that returns only the data of the `data` variable
  if (inputData == null || inputData.isEmpty) {
    return null;
  }

  // Join the strings with single space as separator and trim extra spaces
  return inputData.join(' ').replaceAll(RegExp(r'\s+'), ' ');
}

String convertToOneline(String input) {
  // write function to convert input string to oneline data format
  String onelineData = input.replaceAll(RegExp(r'\s+'), ' ');

  // return oneline data
  return onelineData;
}

String? newCustomFunction(
  String? inputKey,
  String? url,
) {
  // Function to generate random token
  String generateRandomToken() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = math.Random();
    return List.generate(32, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  // Function to construct URL with token
  String constructUrlWithToken(String token, String inputKey, String url) {
    final encodedToken = Uri.encodeComponent(token);
    final encodedKey = Uri.encodeComponent(inputKey);
    final encodedUrl = Uri.encodeComponent(url);
    return '$url?key=$encodedKey&token=$encodedToken';
  }

  // Generate a random token
  String token = generateRandomToken();

  // Construct URL with token
  if (inputKey == null || url == null) {
    return null;
  }
  return constructUrlWithToken(token, inputKey, url);
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
