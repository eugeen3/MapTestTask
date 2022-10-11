import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  GraphQLClient get graphQLClient => GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(
          'https://xn--k1aahcehedi.xn--90ais/graphql',
        ),
      );
}
