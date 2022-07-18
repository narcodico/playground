import 'dart:developer';

class Repository {
  Repository(this.url) {
    log('Repository initiated with url: $url');
  }

  final String url;
}
