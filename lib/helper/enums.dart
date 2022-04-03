//Api requested Content-Type
enum CONTENT_TYPE {
  jsonEncoded,
  xWwwFormUrlencoded,
}
enum NETWORK_REQUEST_TYPE {
  get,
  post,
  put,
  patch,
  delete,
}

enum LOADING_STATUS { initial, success, error, loading }