import 'package:get_it/get_it.dart';
import 'package:portfolio/providers/locale_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LocaleProvider());
}
