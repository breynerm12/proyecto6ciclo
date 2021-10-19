import 'package:prye_orquideas/env.sample.dart';
import 'package:prye_orquideas/models/vivero.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeVivero extends StatefulWidget {
  @override
  HomeViveroState createState() => HomeViveroState();
}

class HomeViveroState extends State<HomeVivero> {
  Future<List<Vivero>> viveros;
  final viveroListKey = GlobalKey<HomeViveroState>();

  @override
  void initState() {
    super.initState();
    viveros = getViveroList();
  }

  Future<List<Vivero>> getViveroList() async {
    //final response = await http.get("${Env.URL_PREFIX}/app/viveros");
    var url = Uri.http(Env.URL_PREFIX, 'app/viveros', {
    });
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Vivero> viveros = items.map<Vivero>((json) {
      return Vivero.fromJson(json);
    }).toList();

    return viveros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: viveroListKey,
      body: Center(
        child: FutureBuilder(
          future: viveros,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render employee lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.home_filled),
                    title: Text(
                      data.nombrempresa,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          child: Text(
                            data.propietario,
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.yellowAccent),
                          child: Text(
                            data.cantorq,
                            style: TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.purple),
                          child: Text(
                            data.contacto,
                            style: TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            /*IconButton(icon: Icon(Icons.edit), onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PersonaFormEdit(modelP: personax)),
                              ).then(onGoBack);
                            }),*/
                            IconButton(icon: Icon(Icons.delete), onPressed: (){
                              showDialog(context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("Mensaje de confirmacion"),
                                      content: Text("Desea Eliminar?"),
                                      actions: [
                                        FlatButton(child: const Text('CANCEL'),
                                          onPressed: (){
                                            Navigator.of(context).pop('Failure');
                                          },
                                        ),
                                        FlatButton( child: const Text('ACCEPT'),
                                            onPressed: (){
                                              Navigator.of(context).pop('Success');
                                            })
                                      ],
                                    );
                                  }
                              ).then((value){
                                /*if(value.toString()=="Success"){
                                  print(personax.id);
                                  Provider.of<PersonaApi>(context, listen: false).deletePersona(personax.id).then((value) => onGoBack(value));
                                  //var onGoBack = onGoBack;
                                  //BlocProvider.of<ProductosBloc>(context).add(DeleteProductoEvent(producto: state.productosList[index]));
                                }*/
                              });
                            })
                          ]
                      )
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}