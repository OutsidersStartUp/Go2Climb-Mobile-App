import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency/agency_page.dart';
import 'package:go2climb/screens/change_agency_plan.dart';
import 'package:go2climb/screens/login_page.dart';
import 'package:go2climb/screens/monitor-clients.dart';
import 'package:go2climb/screens/services_view.dart';

import '../screens/tourist/tourist_page.dart';

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
                                      context, AgencyPage.routeName);
                                },
                                icon: Image.network(
                                  GlobalVariables.user,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            child: PopupMenuButton(
                              onSelected: (result) {
                                switch (result) {
                                  case 'Clientes':
                                    Navigator.pushNamed(
                                        context, MonitorClients.routeName);
                                    break;
                                  case 'Cambiar plan':
                                    Navigator.pushNamed(
                                        context, ChangeAgencyPlan.routeName);
                                    break;
                                  case 'Inicio': 
                                    Navigator.pushNamed(
                                      context, ServicesView.routeName);
                                  break;
                                  case 'Perfil': 
                                    Navigator.pushNamed(
                                      context, TouristPage.routeName);
                                  break;
                                  case 'Cerrar sesi??n': 
                                    Navigator.pushNamed(
                                      context, LoginPage.RouteName);
                                  break;
                                }
                              },
                              iconSize: 35,
                              icon: const Icon(Icons.menu),
                              offset: Offset(AppBar().preferredSize.height / 2,
                                  AppBar().preferredSize.height / 2),
                              itemBuilder: (context) =>
                                  const <PopupMenuItem<String>>[
                                PopupMenuItem<String>(
                                  value: 'Inicio',
                                  child: Text('Inicio')
                                ),
                                PopupMenuItem<String>(
                                  value: 'Perfil',
                                  child: Text('Perfil')
                                ),
                                PopupMenuItem<String>(
                                  value: 'Clientes',
                                  child: Text('Clientes'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Cambiar plan',
                                  child: Text('Cambiar plan'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Cerrar sesi??n',
                                  child: Text('Cerrar sesi??n')
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
