library io_rpc_sample;

import 'dart:io';


import 'package:rpc/rpc.dart';

import 'lib/treeapi.dart';

const String _API_PREFIX = '/api';
final ApiServer _apiServer =
new ApiServer(apiPrefix: _API_PREFIX, prettyPrint: true);

main() async
{
  _apiServer.addApi(new TreeApi());
  _apiServer.enableDiscoveryApi();

  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8080);
  server.listen(_apiServer.httpRequestHandler);
}