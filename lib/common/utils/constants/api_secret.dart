import 'dart:convert';

/* -- LIST OF Constants used in APIs -- */

const String secretAPIKey = "http://10.0.2.2/e_commerce_n_flutter";
final String _basicAuth = 'Basic ${base64Encode(utf8.encode('nawaf:123456'))}';
final Map<String, String> myheaders = {'authorization': _basicAuth};


