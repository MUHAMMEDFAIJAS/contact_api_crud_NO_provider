import 'package:contact_learn/controller/service_provider.dart';
import 'package:contact_learn/model/model.dart';
import 'package:contact_learn/view/add_screen.dart';
import 'package:contact_learn/view/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddContactPage()));
        },
        child: const Text('add'),
      ),
      body: Consumer<Apiprovider>(builder: (context, pro, _) {
        return FutureBuilder(
          future: pro.getall(),
          builder: (context, AsyncSnapshot<List<ApiModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("error code "),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ApiModel data = snapshot.data![index];
                  return ListTile(
                    title: Text(data.name.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            pro.deleteddata(data.id!);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UpdateScreen(
                                        name: data.name.toString(),
                                        address: data.address.toString(),
                                        email: data.email.toString(),
                                        phone: data.phone.toString(),
                                        id: data.id,
                                      )));
                            },
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      }),
    );
  }
}
