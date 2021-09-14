import 'package:app_mobx/src/home/home_page.dart';
import 'package:app_mobx/src/people/people_page.dart';

class RouterApp {
/*--------------------------------------------------------------HOME----------*/
  static const HOME_KEY = '/home';
  static final homePage = HomePage();

/*--------------------------------------------------------------PEOPLE--------*/
  static const PEOPLE_KEY = '/people';
  static final peoplePage = PeoplePage();
}
