import 'dart:convert';

/* -- LIST OF Secret Constants used in APIs -- */
const String imageApiLink = "http://192.168.8.202/e_commerce_n_flutter/uploads";
const String secretAPIKey = "http://192.168.8.202/e_commerce_n_flutter";
final String _basicAuth = 'Basic ${base64Encode(utf8.encode('nawaf:123456'))}';
final Map<String, String> myheaders = {'authorization': _basicAuth};
