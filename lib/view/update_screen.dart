import 'package:contact_learn/controller/service_provider.dart';
import 'package:contact_learn/model/model.dart';
import 'package:contact_learn/service/servise.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  UpdateScreen({
    super.key,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.id,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Apiprovider>(context);
    TextEditingController nameController =
        TextEditingController(text: widget.name);
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController phoneController =
        TextEditingController(text: widget.phone);
    TextEditingController addressController =
        TextEditingController(text: widget.address);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD CONTACT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            const Gap(20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const Gap(20),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                  hintText: 'address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const Gap(20),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: 'phone-no',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
                onPressed: () {
                  pro.updatedata(ApiModel(
                      address: addressController.text,
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      id: widget.id));
                  Navigator.pop(context);
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
