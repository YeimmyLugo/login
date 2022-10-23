
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
//la variabble que llama al loginpage
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
//variables de los controladores que se utilizaran en la pagina de resgistro
class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userProfileController = TextEditingController();
//se crea la funcion para verificar e ingresar
  Future signIn() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
//estos campos seran los que se agreguen a la base de datos como datos personales adicionales del registro
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _userProfileController.text.trim(),
        _emailController.text.trim()
      );
    }
  }
//se crea la funcion que verifica si esta en la base de datos y lo traera
  Future addUserDetails(
      String firstName,
      String lastName,
      String userProfile,
      String email
      ) async {
    await FirebaseFirestore.instance.collection('cuentas').add({
      'first name': firstName,
      'last name': lastName,
      'user profile': userProfile,
      'email': email,
    });
  }

  //verifica los controles que tienen un mismo dato en este caso las contraseñas
  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
//inicializa las variables
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _userProfileController.dispose();
    super.dispose();
  }

// se creara el widget para contener el icono y los textos iniciales y se les dara diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                      '¡Bienvenido nuevo usuario!',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 60,
                      )
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Registre sus datos a continuación',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  //se crea el campo para el nombre con el diseño
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        //se llama el controlador para que guarde en la variable lo que se ingrese
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            //texto que contendra el campo
                            hintText: 'Nombre',
                            fillColor: Colors.grey[200],
                            filled: true
                        ),
                      )
                  ),
                  //se crea el campo para tomar el apellido
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        //se llama el controlador de la variable para que guarde lo que se digite
                        controller: _lastNameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Apellidos',
                            fillColor: Colors.grey[200],
                            filled: true
                        ),
                      )
                  ),
                  //se crea el campo para pedir el perfil de la persona
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: _userProfileController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Perfil',
                            fillColor: Colors.grey[200],
                            filled: true
                        ),
                      )
                  ),
                  //se crea el campo para que tome el email
                  const SizedBox(height: 30),
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
                  // se crea el campo para tomar la contraseña
                  const SizedBox(height: 30),const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Contraseña',
                            fillColor: Colors.grey[200],
                            filled: true
                        ),
                      )
                  ),
                  //se crea el campo para confirmar que las contraseñas sean iguales y realize el registro
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Confirma contraseña',
                            fillColor: Colors.grey[200],
                            filled: true
                        ),
                      )
                  ),

                  // se crea el boton para que guarde lo digitado en los campos //boton de inicio
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      //al hacer click guarda y registra todos los datos digitados de los anteriores campos creados
                      onTap: signIn, //metodo que gestiona el inicio de sesion
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Registrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '¡Soy miembro!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        //al hacer click retorna a la pagina de login
                        onTap: widget.showLoginPage,
                        child: const Text(
                            ' Iniciar sesión',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
