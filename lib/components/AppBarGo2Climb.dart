import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency_profile.dart';

class AppBarGo2Climb extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGo2Climb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
      flexibleSpace: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: 10.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 2.5),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: GlobalVariables.whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AgencyProfile.routeName);
                                },
                                icon: Image.network(
                                  GlobalVariables.user,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            child: PopupMenuButton(
                              iconSize: 35,
                              icon: const Icon(Icons.menu),
                              offset: Offset(AppBar().preferredSize.height / 2,
                                  AppBar().preferredSize.height / 2),
                              itemBuilder: (context) =>
                                  const <PopupMenuItem<String>>[
                                PopupMenuItem<String>(
                                  child: Text('Inicio'),
                                ),
                                PopupMenuItem<String>(
                                  child: Text('Perfil'),
                                ),
                                PopupMenuItem<String>(
                                  child: Text('Clientes'),
                                ),
                                PopupMenuItem<String>(
                                  child: Text('Cambiar plan'),
                                ),
                                PopupMenuItem<String>(
                                  child: Text('Cerrar sesión'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(57.5);
}
