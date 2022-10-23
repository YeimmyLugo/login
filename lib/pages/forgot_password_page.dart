import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//se crae la variable que contiene el correo
  final _emailController = TextEditingController();
//retornara la cuenta del correo
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
//se crea la funcion para restablecer la contraseña
  Future passwordReset() async {
    // se crea la variable para que contenga y verifique si existe la cuenta con emailcontroller
    var cuentaEmail = _emailController.text.trim();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: cuentaEmail);
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          //se le mandara un mensaje de alerta para que confirme cuando se envie el correo
          return AlertDialog(
            title: const Text('Recuperacion de contraseña'),
            //aqui se nevia el mensaje a el correo que digite si empre y cuando este registrado en el firebase
            content: Text('Un Email ha sido enviado a la cuenta $cuentaEmail'),
            actions: <Widget>[
              //este boton permitira cerrar el mensaje
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    }
    //permitira que en caso que no exista el correo se mande un mensaje de error
    on FirebaseAuthException catch(e) {
      print(e);
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Firebase Error'),
            content: Text('Email error: $e'),
            actions: <Widget>[
              //boton que permite cerrar el mensaje
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
//se crea el widget para los mensajes y campos al restablecer la contraseña
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //se crea el campo para pedir el restablecimiento de contraseña
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              //texto de solicitud que aparecera arriba del campo
                'Ingrese su Email para enviar el restablecimiento de contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          //se crea el campo para confirmar el email para el cambio
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true
              ),
            )
          ),
          //se crea el boton para que de la funcionalidad de confirmar y enviar el correo
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            color: Colors.deepPurple[200],
            child: const Text(
              'Restablecer Contraseña',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          )
        ],
      ),
    );
  }
}
