import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

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
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten' : _glutenFree ,
                'lactose' : _lactoseFree ,
                'vegetarian' : _vegetarian ,
                'vegan' : _vegan ,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal section.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten-free', 'The meal is gluten free', _glutenFree,
                    (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Lactose-free', 'The meal is lactose free', _lactoseFree,
                    (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'The meal is vegetarian', _vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                }),
                _buildSwitchListTile('Vegan', 'The meal is vegan', _vegan,
                    (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
