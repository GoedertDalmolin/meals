import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/data/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch({
    required String title,
    required String subTitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onChanged,
    );
  }

  var settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Configurações'),
      //   centerTitle: true,
      // ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                title: 'Sem Glúten',
                subTitle: 'Só exibe refeições sem glúten.',
                value: settings.isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    settings.isGlutenFree = value;
                  });
                },
              ),
              _createSwitch(
                title: 'Sem Lactose',
                subTitle: 'Só exibe refeições sem lactose.',
                value: settings.isLactoseFree,
                onChanged: (value) {
                  setState(() {
                    settings.isLactoseFree = value;
                  });
                },
              ),
              _createSwitch(
                title: 'Vegana',
                subTitle: 'Só exibe refeições veganas.',
                value: settings.isVegan,
                onChanged: (value) {
                  setState(() {
                    settings.isVegan = value;
                  });
                },
              ),

              _createSwitch(
                title: 'Vegetariana',
                subTitle: 'Só exibe refeições vegetarianas.',
                value: settings.isVegetarian,
                onChanged: (value) {
                  setState(() {
                    settings.isVegetarian = value;
                  });
                },
              ),

            ],
          ))
        ],
      ),
    );
  }
}
