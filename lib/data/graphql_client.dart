import 'package:graphql/client.dart';

class GraphQLClientProvider {
  late final GraphQLClient? instance;

  getClient() {
    if (instance == null) {
      final Link link = HttpLink(
        'https://xn--k1aahcehedi.xn--90ais/graphql',
      );

      instance = GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      );
      print('Created GraphQLClient');
    }
    return instance;
  }
}
