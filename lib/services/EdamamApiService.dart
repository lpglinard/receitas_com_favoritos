class EdamamApiService {
  static const String _endpoint = 'https://api.edamam.com/search';
  String _query = '';
  String? filter;
  static const String _appId = 'ccc91a5b';
  static const String _appKey = '7acd07a6b64c91a0ee9580aa32672b7b';
  String get url => '$_endpoint?q=$_query&app_id=$_appId&app_key=$_appKey';
  String get _filter => '$_endpoint?q=$_query&app_id=$_appId&app_key=$_appKey&health=$filter';
  set query(String query) {
    assert(query != null && query.isNotEmpty);
    _query = query;
  }
}
