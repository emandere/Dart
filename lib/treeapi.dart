library treeapi;
import 'dart:io';
import 'package:rpc/rpc.dart';
import 'dart:async';
import 'puretree.dart';
import "package:serialization/serialization.dart";


class TreeResponse
{
  String result;
  TreeResponse();
}

@ApiClass(
    name: 'cloud',  // Optional (default is 'cloud' since class name is Cloud).
    version: 'v1'
)
class TreeApi
{
  TreeApi();
  @ApiMethod(path: 'hello')
  TreeResponse hello() { return new TreeResponse()..result = 'Hello there!'; }
  @ApiMethod(path: 'tree')
  tree gettree(){return new tree.gen();}
  @ApiMethod(path: 'test')
  TreeResponse test()
  {
    tree testree = new tree.gen();
    var s = new Serialization()
      ..addRuleFor(tree);
    var serialized = s.write(testree);
    return new TreeResponse()..result = serialized;

  }
}