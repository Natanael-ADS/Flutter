import 'package:app_mobx/src/shared/tools/const.dart';
import 'package:app_mobx/src/shared/tools/texts.dart';
import 'package:app_mobx/src/shared/tools/utils.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PeoplePage extends StatelessWidget {
  final idMaskDate = 1;
  final idMaskCellPhone = 2;
  final List<String> list = [Texts.MAN, Texts.WOMAN];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PEOPLE'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Icon(
                  Icons.person_add,
                  size: 100,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(8.0),
                    children: [
                      _textField(titulo: Texts.INSERT_IMAGE),
                      Utils.space(),
                      _textField(titulo: Texts.INSERT_NAME),
                      Utils.space(),
                      _textField(
                        titulo: Texts.INSERT_DATEBIRTH,
                        keyboard: TextInputType.datetime,
                        idMask: idMaskDate,
                      ),
                      Utils.space(),
                      _textField(
                        titulo: Texts.INSERT_FONE,
                        keyboard: TextInputType.number,
                        idMask: idMaskCellPhone,
                      ),
                      Utils.space(),
                      _textField(
                        titulo: Texts.INSERT_EMAIL,
                        keyboard: TextInputType.emailAddress,
                      ),
                      _dropDownButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? value;
  _dropDownButton() {
    return DropdownButton<String>(
      onChanged: (value) => this.value = value,
      items: list.map((valueItem) {
        return DropdownMenuItem<String>(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }

  _textField({
    required String titulo,
    keyboard = TextInputType.text,
    int? idMask,
  }) {
    return TextFormField(
      onChanged: (value) {},
      keyboardType: keyboard,
      inputFormatters: [_typeMask(idMask)],
      decoration: InputDecoration(labelText: titulo),
    );
  }

  _typeMask(int? idMask) {
    if (idMaskDate == idMask) {
      return TextInputMask(mask: Const.MASK_DATE);
    }

    if (idMaskCellPhone == idMask) {
      return TextInputMask(mask: Const.MASK_CELLPHONE);
    }

    return FilteringTextInputFormatter.singleLineFormatter;
  }
}
