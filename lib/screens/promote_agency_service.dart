import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PromoteAgencyService extends StatefulWidget {
  static const String routeName = '/promote-agency-service';
  const PromoteAgencyService({super.key});

  @override
  State<PromoteAgencyService> createState() => _PromoteAgencyService();
}

class _PromoteAgencyService extends State<PromoteAgencyService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
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
                                  onPressed: () {},
                                  icon: Image.network(
                                    GlobalVariables.user,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.menu),
                              onPressed: () {},
                              color: GlobalVariables.blackColor,
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
      ),
      body: SingleChildScrollView(
                child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      color: GlobalVariables.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //Form
                    child: SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        newSubtitle("Agregar nuevo servicio"),
                        sizedBox(),
                        newSubtitle("Promocionar servicio"),
                        sizedBox(),
                        Container(
                          child: const Text('Promociona tu servicio y llega a mas personas. Los usuarios que promocionan sus servicios tienen una mayor relevancia al realizar una busqueda.',
                          textAlign: TextAlign.justify,),
                        ),
                        sizedBox(),
                        newSubtitle("Tiempo de promocion"),
                        sizedBox(),
                        DateForm(context),
                        sizedBox(),
                        priceForm(),
                        sizedBox(),
                        Row(
                          children: const [
                            Spacer(),
                            Text("Costo diario por promocion: 5.00 USD",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontStyle: FontStyle.italic
                              ),
                            )
                          ],
                        ),
                      sizedBox(),
                      newSubtitle("Metodo de pago"),
                      sizedBox(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                            color: Colors.transparent,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: GlobalVariables.primaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                          ),
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: const Text('Tarjeta 01',
                            textAlign: TextAlign.justify,),
                          
                        ),
                        sizedBox(),
                        sizedBox(),
                        sizedBox(),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              OutlinedButton(onPressed: () {}, child: const Text("Omitir")),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                  backgroundColor: Theme.of(context).colorScheme.primary,
                                  ).copyWith(
                                    elevation: ButtonStyleButton.allOrNull(0.0)),
                                onPressed: () {},
                                child: const Text('Continuar'),
                              )
                            ],)
                        )
                      ]),
                    )
                  )
              ],
            ),
          ),
        ),

      )
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      );

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }
}

SizedBox sizedBox() => const SizedBox(height: 20);

Row newSubtitle(String subtitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Text(subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
    ],
  );
}

Container _startDate() {
  var dateMask = MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: GlobalVariables.primaryColor, width: 3)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: SizedBox(
      child: TextFormField(
      inputFormatters: [dateMask],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }
        final components = value.split("/");
        if (components.length == 3) {
          final day = int.tryParse(components[0]);
          final month = int.tryParse(components[1]);
          final year = int.tryParse(components[2]);
          if (day != null && month != null && year != null) {
            final date = DateTime(year, month, day);
            if (date.year == year && date.month == month && date.day == day) {
              return null;
            }
          }
        }
        return "Fecha no valida";
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: InputBorder.none, hintText: "De: 08/08/2021"
        ),
      )
    ),
  );
}

Container _endDate() {
    var dateMask =
        MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [dateMask],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null;
          }
          final components = value.split("/");
          if (components.length == 3) {
            final day = int.tryParse(components[0]);
            final month = int.tryParse(components[1]);
            final year = int.tryParse(components[2]);
            if (day != null && month != null && year != null) {
              final date = DateTime(year, month, day);
              if (date.year == year && date.month == month && date.day == day) {
                return null;
              }
            }
          }
          return "Fecha no valida";
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "Hasta: 08/09/2021"),
      )),
    );
  }

Container priceForm() {
  var priceMask = MaskTextInputFormatter(mask: 'S/.####', filter: {"#": RegExp(r'[0-9]')});
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GlobalVariables.primaryColor, width: 3)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: SizedBox(
      child: TextFormField(
      inputFormatters: [priceMask],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: InputBorder.none, hintText: "200 PEN"),
      )
    ),
  );
}

Row DateForm(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _startDate()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, child: _endDate()),
      ],
    );
}