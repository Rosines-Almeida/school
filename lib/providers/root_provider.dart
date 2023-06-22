import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:school/providers/afazer_provider.dart';

//arquivo para gerenciar providers
class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      //criar instancia do provider
      ChangeNotifierProvider(create: (_) => AfazerProvider()),
    ];
  }
}
