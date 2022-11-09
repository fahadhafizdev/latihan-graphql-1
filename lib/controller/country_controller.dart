import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:latihan_graphql_1/models/countries_model.dart';

class CountryController extends GetxController {
  RxList<CountriesModel> dataCountry = <CountriesModel>[].obs;

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
    dataCountry.value = [];
    final options = WatchQueryOptions(
      document: gql(readRepositories),
      // variables: <String, dynamic>{
      //   'nRepositories': nRepositories,
      // },
      pollInterval: const Duration(seconds: 4),
      fetchResults: true,
    );

    final result = await client.query(options);

    if (result.hasException) {
      log('error get data');
      return;
    }

    log(result.data!['continents'][0]['countries'].toString());
    var repo = result.data!['continents'][0];

    var a = CountriesModelResponse.fromJson(repo);

    dataCountry.value = a.countries!;

    dataCountry.map((e) => log(e.name.toString())).toList();
  }

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }
}
