import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryController extends GetxController {
  static final HttpLink _httpLink = HttpLink(
    'https://countries.trevorblades.com',
  );

  String readRepositories = """
  query{
  continents {
    name
   code
    countries{
      name
      code
    }
  }
}
""";

  final GraphQLClient client = GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(),
  );

  Future<void> getCountry() async {
    final options = WatchQueryOptions(
      document: gql(readRepositories),
      // variables: <String, dynamic>{
      //   'nRepositories': nRepositories,
      // },
      pollInterval: const Duration(seconds: 4),
      fetchResults: true,
    );

    final result = await client.query(options);

    log(result.data!['continents'][0]['countries'].toString());
    final repo = result.data!['continents'][0]['countries'] as List<dynamic>;

    repo.map((e) => log(e['name'].toString())).toList();
  }

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }
}
