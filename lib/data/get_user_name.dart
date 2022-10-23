import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //leera la coleccion que existe en cuentas
    CollectionReference users = FirebaseFirestore.instance.collection('cuentas');

    //se crea la funcion para que traiga la coleccion que existe en cuentas
    return FutureBuilder<DocumentSnapshot>(
      //se trae gon el get por medio de la variable document id
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          //se retornara los campos de nombre, apellido y perfil
          return Text('${data['first name']} ${data['last name']}, ${data['user profile']}');
        }
        return const Text('Cargando...');
      })
    );
  }
}
