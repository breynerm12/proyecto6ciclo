import 'package:flutter/material.dart';
import 'package:prye_orquideas/pantallas/home_vivero.dart';
import 'package:prye_orquideas/pantallas/orquidea.dart';



class NavDrawer extends StatefulWidget {
  NavDrawerState createState() => NavDrawerState();
  
}

class NavDrawerState extends State<NavDrawer>{
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return HomeVivero();
      case 1: return Orquide();
    }
  }

  _onSelectItem(int pos){
    setState((){
      _selectDrawerItem = pos;
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[      
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/info.jpeg'))),
              ),
              ListTile(
                leading: Icon(Icons.input),
                title: Text('Personas'),
                onTap: () => {
                  Navigator.of(context).pop()
                },
              ),
              ListTile(
                leading: Icon(Icons.verified_user),
                title: Text('Orquideas'),
                selected: (1 == _selectDrawerItem),
                onTap: () =>{
                  Navigator.of(context).pop(),
                  _onSelectItem(1)
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Víveros'),
                selected: (0 == _selectDrawerItem),
                onTap: () =>{
                  Navigator.of(context).pop(),
                  _onSelectItem(0)
                },     
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Familia'),
                onTap: () => {
                  Navigator.of(context).pop()
                },
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Especie'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Genero'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () => {Navigator.of(context).pop()},
              ),
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}