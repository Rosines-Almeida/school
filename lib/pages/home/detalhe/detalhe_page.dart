import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school/components/body_component.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/pages/home/components/detalhe_header_widget.dart';
import 'package:school/pages/home/components/detalhe_menu_widget.dart';
import 'package:school/pages/home/detalhe/components/detalhe_item_widget.dart';
import 'package:school/providers/afazer_provider.dart';
import 'package:school/services/picker_service.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AfazerProvider store;
  int? idx;

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      store.selecionado!.image = base64;
      store.atualizarItemAfazer(idx!);
    }
  }

  void onDone() {
    store.selecionado!.isConcluido = true;
    store.atualizarItemAfazer(idx!);
  }

  void onDelete() {
    store.removerItemAfazer(idx!);
    Navigator.pop(context);
  }

  void itemOnChange(int index, bool value) {
    store.selecionado!.conteudos[index]!.isChecked = value;
    store.atualizarItemAfazer(idx!);
  }

  List<Widget> lista() {
    //asMap, mapeia e pega as entradas
    return store.selecionado!.conteudos.asMap().entries.map((el) {
      return DetalheItemWidget(
        item: el.value,
        onChanged: (value) {
          itemOnChange(el.key, value ?? false);
        },
      );
    }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg != null) {
      idx = arg as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    if (store.selecionado == null) {
      Navigator.of(context).pop();
      return const Text('Selecione um item da lista');
    }

    return BodyComponent(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(children: [
          DetalheHeaderWidget(
            item: store.selecionado!,
            onEdit: onEditImage,
          ),

          //faz elevação do item para sobrepor outri
          const SpacerComponent(),
          DetalheMenuWidget(
            item: store.selecionado!,
            onDone: onDone,
            onDelete: onDelete,
          ),
          const SpacerComponent(),
          ...lista(),
        ]),
      ),
    );
  }
}
