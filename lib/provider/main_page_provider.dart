import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_test/presentation/main/main_page_viewmodel.dart';

final promptProvider = ChangeNotifierProvider<MainPageViewmodel>((ref) {
  return MainPageViewmodel();
});
