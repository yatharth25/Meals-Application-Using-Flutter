import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'] as bool;
    _lactoseFree = widget.currentFilter['lactose'] as bool;
    _vegan = widget.currentFilter['vegan'] as bool;
    _vegetarian = widget.currentFilter['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegeterian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selction!",
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-free", "Only includes Gluten free meals", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                  print(newValue);
                });
              }),
              _buildSwitchListTile("Lactose-free",
                  "Only includes Lactose free meals", _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                  print(newValue);
                });
              }),
              _buildSwitchListTile("Vegan", "Only includes Vegan meals", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                  print(newValue);
                });
              }),
              _buildSwitchListTile(
                  "Vegeterian", "Only includes Vegeterian meals", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                  print(newValue);
                });
              })
            ],
          ))
        ]));
  }
}
