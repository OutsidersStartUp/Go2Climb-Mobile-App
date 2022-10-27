import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency_profile.dart';
import 'package:go2climb/screens/promote_agency_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateAgencyService extends StatefulWidget {
  static const String routeName = '/create-agency-service';
  CreateAgencyService({super.key});

  @override
  State<CreateAgencyService> createState() => _CreateAgencyServiceState();
}

class _CreateAgencyServiceState extends State<CreateAgencyService> {
  bool isVisible = false;

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
                        agencyServiceForm(),
                        sizedBox(),
                        newSubtitle("Actividades a realizar"),
                        sizedBox(),
                        activityForm(),
                        sizedBox(),
                        newSubtitle("Horario"),
                        sizedBox(),
                        scheduleForms(context),
                        sizedBox(),
                        newSubtitle("Precio"),
                        sizedBox(),
                        priceForm(),
                        sizedBox(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton.icon(
                            icon: Text("Agregar oferta"),
                            label: Icon(Icons.add),
                            onPressed: () => setState(() => isVisible = !isVisible),
                          ),
                        ),
                        Visibility(
                          visible: isVisible,
                          child: Container(
                          child: SingleChildScrollView(
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              newSubtitle("Precio promocional (USD)"),
                              sizedBox(),
                              priceForm(),
                              sizedBox(),
                              newSubtitle("Válido"),
                              sizedBox(),
                              scheduleForms(context),
                              sizedBox(),
                          ],),)
                        )),
                        newSubtitle("Imagenes referenciales"),
                        sizedBox(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Image.network(GlobalVariables.uploadImage)),
                        sizedBox(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context, PromoteAgencyService.routeName);
                                },
                                child: const Text("Continuar")))
                      ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row scheduleForms(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _startTime()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, child: _endTime()),
      ],
    );
  }

  Row scheduleForOfferForms(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _startTime()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, child: _endTime()),
      ],
    );
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
              )),
        ),
      ],
    );
  }

  Container agencyServiceForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Nombre del servicio"),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Lugar"),
          ),
          TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Descripción")),
        ],
      )),
    );
  }

  Container activityForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "ejm: alpinismo"),
      )),
    );
  }

  Container _startTime() {
    var timeMask =
        MaskTextInputFormatter(mask: '##:##', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [timeMask],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "De: 08:00"),
      )),
    );
  }

  Container _endTime() {
    var timeMask =
        MaskTextInputFormatter(mask: '##:##', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [timeMask],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "Hasta: 10:00"),
      )),
    );
  }

  Container priceForm() {
    var priceMask = MaskTextInputFormatter(
        mask: 'S/.####', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [priceMask],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "200 PEN"),
      )),
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
