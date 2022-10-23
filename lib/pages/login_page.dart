import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  //llamara la pagina de register page
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

//se crea las variables para el controlador de campo
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
//se crea la funcion para traer lo que este en la base de datos
  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
//retornara los campos
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

// se crea el widget para que aparezca el titulo y el icono
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //se crea el icono de inicio
                const Icon(
                    Icons.phone_android,
                  size: 100,
                ),
                const SizedBox(height: 75),
                Text(
                  //titulo inicial
                  '¡Hola Amigo!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bienvenido de nuevo, ingresa ahora',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //diseño del campo que contendra el email
                const SizedBox(height: 20),
                Padding(
                  //se le asignan los tamaños y colores
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    //llama la variable en la que esta guardada el email en este caso
                    controller: _emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      //texto que aparecera dentro del campo
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                      ),
                  )
                ),
                //se crea el campo para ingresar la contraseña
                const SizedBox(height: 20),
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
                      //texto que aparecera dentro del campo contraseña
                      hintText: 'Contraseña',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  )
                ),
                //se crea el boton para iniciar sesion y entre a la cuenta creada en la base de datos
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: GestureDetector (
                      //al hacer click en el boton este entrara a la cuenta si esta creada
                      onTap: logIn,
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                    )
                  )
                ),
                //se crean los textos para la funcionalidad de registrar
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '¿No tienes cuenta?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //se crea el detector de gestos para cuando se de click entre a la pagina de registro
                    GestureDetector(
                      //con el clic entra a la pagina register page que esta en el directorio pages
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        ' ¡Registrate aqui',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                ),
                //se crea una opcion para el restablecimiento de contraseña
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              }
                            ),
                          );
                        },
                        child: const Text (
                          '¿Olvidaste la contraseña?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

