import 'package:e_commerce/Data/Model/Address_Model.dart';
import 'package:flutter/material.dart';

class Cardaddress extends StatelessWidget {
  final Address_Model address_model;
  final void Function()? onedit;
  final void Function()? ondelete;
  const Cardaddress(
      {super.key,
      required this.address_model,
      required this.onedit,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            address_model.addressName!,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          subtitle: Text(
              "${address_model.addressStreet}/${address_model.addressBuilding}/${address_model.addressApartment}"),
          trailing: IconButton(
            onPressed: ondelete,
            icon: Icon(Icons.delete_outline_outlined),
            color: Colors.red,
            iconSize: 30,
          ),
        ),
      ),
    );
  }
}
