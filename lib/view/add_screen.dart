// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:contact_learn/controller/service_provider.dart';
import 'package:contact_learn/model/model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatelessWidget {
  AddContactPage({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Apiprovider>(context, listen: false);
    log('message');
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
                      borderSide: const BorderSide(color: Colors.blue))),
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
                  pro.adddata(ApiModel(
                      address: addressController.text,
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text));
                  Navigator.pop(context);
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
