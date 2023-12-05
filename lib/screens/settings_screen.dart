import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/data/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChange;

  const SettingsScreen({super.key, required this.onSettingsChange, required this.settings});

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
      onChanged: (value) {
        onChanged(value);

        widget.onSettingsChange(widget.settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.all(20),
          //   child: Text(
          //     'Configurações',
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                title: 'Sem Glúten',
                subTitle: 'Só exibe refeições sem glúten.',
                value: widget.settings.isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    widget.settings.isGlutenFree = value;
                  });
                },
              ),
              _createSwitch(
                title: 'Sem Lactose',
                subTitle: 'Só exibe refeições sem lactose.',
                value: widget.settings.isLactoseFree,
                onChanged: (value) {
                  setState(() {
                    widget.settings.isLactoseFree = value;
                  });
                },
              ),
              _createSwitch(
                title: 'Vegana',
                subTitle: 'Só exibe refeições veganas.',
                value: widget.settings.isVegan,
                onChanged: (value) {
                  setState(() {
                    widget.settings.isVegan = value;
                  });
                },
              ),

              _createSwitch(
                title: 'Vegetariana',
                subTitle: 'Só exibe refeições vegetarianas.',
                value: widget.settings.isVegetarian,
                onChanged: (value) {
                  setState(() {
                    widget.settings.isVegetarian = value;
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
