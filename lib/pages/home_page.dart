import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //lista de indetificadores de documentos(Id documents :: firestore)
  List<String> docIds = [];

  //metodo para obtener la lista de identificadores de documentos
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('cuentas').get().then(
        (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference); //imprimira la lista de documentos
          docIds.add(document.reference.id);
        })
    );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }
// se crea el widget para inicio de sesion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Inicio Sesión ${user.email!}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
            actions: [
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Icon(Icons.logout),
              )
            ],
          ),
            body: Center(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: FutureBuilder(
                        future: getDocId(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: docIds.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: GetUserName(documentId: docIds[index]),
                                  tileColor:Colors.grey[200],
                                ),
                              );
                            }
                          );
                        },
                      )
                  )
                ],
              ),
            ),
    );
  }
}
