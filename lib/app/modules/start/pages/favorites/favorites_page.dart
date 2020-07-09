import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';
import 'favorites_controller.dart';
import './components/text_component.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key key, this.title = "Favoritos"}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState
    extends ModularState<FavoritesPage, FavoritesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(letterSpacing: 1.0),
        ),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Observer(
          builder: (_) {
            return ListView.builder(
              itemCount: controller.favorites?.length ?? 0,
              itemBuilder: (context, index) {
                var item = controller.favorites[index];
                return Stack(
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              size: size.height * 0.08,
                              color: Colors.grey,
                            ),
                            TextComponent(
                              item: item,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          controller.addToList(item, index);
                        },
                        child: Icon(Icons.star),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
