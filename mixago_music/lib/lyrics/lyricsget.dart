import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<String> getlyrics({required mytitle, required myartist}) async {
  log('lyrics');
  var uri = Uri.https(
    'powerlyrics.p.rapidapi.com',
    'getlyricsfromtitleandartist',
    {'title': mytitle, 'artist': mytitle},
  );
  final response = await http.get(
    uri,
    headers: {
      'X-RapidAPI-Key': '98a8ef38a0msha6c079fab6bbcb3p1e057bjsn483c2eb70546',
      'X-RapidAPI-Host': 'powerlyrics.p.rapidapi.com'
    },
  );
  final bodyasjson = jsonDecode(response.body) as Map<String, dynamic>;
  log(bodyasjson.toString());
  log(bodyasjson["lyrics"].toString());
  String lyricstring = bodyasjson['lyrics'] == null
      ? 'No Lyrics found'
      : bodyasjson["lyrics"].toString();
  log(lyricstring);
  return lyricstring;
}
