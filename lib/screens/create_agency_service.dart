import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';

import 'package:go2climb/screens/promote_agency_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;

import '../models/create_service.dart';

class CreateAgencyService extends StatefulWidget {
  static const String routeName = '/create-agency-service';
  CreateAgencyService({super.key});

  @override
  State<CreateAgencyService> createState() => _CreateAgencyServiceState();
}

class _CreateAgencyServiceState extends State<CreateAgencyService> {
  bool isVisible = false;

  final url = Uri.parse("https://go2climb.azurewebsites.net/api/v1/services");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  late Future<CreateService> createService;

  bool isOffer = false;
  int agencyId = 1;
  String creationDate = DateTime.now().toString().substring(0, 10);

  final name = TextEditingController();
  final location = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final newPrice = TextEditingController();
  final photos = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

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
                      child: Form(
                        key: _keyForm,
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          newSubtitle("Agregar nuevo servicio"),
                          sizedBox(),
                          agencyServiceForm(),
                          sizedBox(),
                          newSubtitle("Actividades a realizar"),
                          sizedBox(),
                          activityForm(),
                          sizedBox(),
                          newSubtitle("Precio"),
                          sizedBox(),
                          priceForm(),
                          sizedBox(),
                          addOfferToggle(),
                          addOfferForm(),
                          newSubtitle("Imagenes referenciales"),
                          sizedBox(),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.network(GlobalVariables.uploadImage)),
                          sizedBox(),
                          urlImageForm(),
                          sizedBox(),
                          continueButton(context)
                        ]),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateForm(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  Container continueButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            if (_keyForm.currentState!.validate()) {
              saveService();
              Navigator.pushNamed(context, PromoteAgencyService.routeName);
            }
          },
          style: ButtonStyle(
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size(double.infinity, 40)),
            backgroundColor: const MaterialStatePropertyAll<Color>(
                GlobalVariables.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: const Text(
            "Continuar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ));
  }

  Container urlImageForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        validator: validateForm,
        controller: photos,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Url de la imagen del servicio"),
      )),
    );
  }

  void saveService() async {
    if (newPrice.text != '') {
      isOffer = true;
    }
    final newService = {
      "name": name.text,
      "location": location.text,
      "description": description.text,
      "price": price.text,
      "newPrice": newPrice.text,
      "photos": photos.text,
      "creationDate": creationDate,
      "isOffer": isOffer,
      "agencyId": agencyId
    };
    await http.post(url, headers: headers, body: jsonEncode(newService));
    name.clear();
    location.clear();
    description.clear();
    price.clear();
    newPrice.clear();
    photos.clear();
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
        Text(subtitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
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
            validator: validateForm,
            controller: name,
            decoration: const InputDecoration(hintText: "Nombre del servicio"),
          ),
          TextFormField(
            validator: validateForm,
            controller: location,
            decoration: const InputDecoration(hintText: "Lugar"),
          ),
          TextFormField(
            validator: validateForm,
            controller: description,
            decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Descripción")),
        ],
      )),
    );
  }

  Container addOfferToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        icon: const Text("Agregar oferta"),
        label: const Icon(Icons.add),
        onPressed: () => setState(() => isVisible = !isVisible),
      ),
    );
  }

  Visibility addOfferForm() {
    return Visibility(
        visible: isVisible,
        child: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          newSubtitle("Precio promocional (USD)"),
          sizedBox(),
          offerPriceForm(),
          sizedBox(),
          newSubtitle("Válido"),
          sizedBox(),
          scheduleForms(context),
          sizedBox(),
        ],
          ),
        ));
  }

  Container activityForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        validator: validateForm,
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
    var priceMask =
        MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        validator: validateForm,
        inputFormatters: [priceMask],
        keyboardType: TextInputType.number,
        controller: price,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "200 PEN"),
      )),
    );
  }

  Container offerPriceForm() {
    var priceMask =
        MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [priceMask],
        keyboardType: TextInputType.number,
        controller: newPrice,
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
    return const Text('');
  }
}
