import 'package:flutter/material.dart';

enum Page {
  login,
  main
}

class PageState extends ChangeNotifier {
  Page _currPage = Page.main;
  void changePage(Page newPage) {
    _currPage = newPage;
    notifyListeners();
  }

  Page get currPage => _currPage;
}