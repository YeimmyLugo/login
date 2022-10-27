# login_ui

- INICIO DE SESIÓN:

Como pagina inicial se presenta el inicio de sesión que contiene 2 campos para ingresar el Email y la contraseña, por supuesto iniciara siempre y cuando el usuario este registrado en la base de datos Firestorte. Tiene un boton de inicio de sesion que permitira ingresar a la cuenta de Email que ingreso el usuario y tambien en la parte inferior contiene 2 textos uno que nos llevara a la pagina de resgitro y el otro para restablecer la contraseña.

![image](https://user-images.githubusercontent.com/101755814/198275348-5aba0033-bad7-411a-8b6f-b52781dde8cd.png).

A continuación se observa como inicio sesion en una cuenta con Email que se ingreso en el inicio de sesión, a parte de eso se muestran todas las personas que tienen una cuenta registrada en la base de datos.

![image](https://user-images.githubusercontent.com/101755814/198275967-476dffe9-fbe2-49e0-a471-b2e5f58c2831.png).

- REGISTRO:

Cuando se da al boton de "Registarte aqui" envia a la pagina de registro de usuario la cual cuenta con 6 campos que pedira los siguientes datos.

- Nombre.
- Apellido.
- Perfil.
- Email.
- Contraseña.
- Verificación de contraseña.

Tambien cuenta con el boton "Registrar" para realizar la operación de registro y guardarla en la base de datos, asi como tambien se encuentra en la parte inferior un texto "Inicar sesion" para volver a la pagina de inicio de sesión.

![image](https://user-images.githubusercontent.com/101755814/198281571-a9a0521f-b573-44f0-a1ff-b844e9faa25d.png).

A continuación se ve como el usuario que registre aparece en la lista de cuentas registradas y automaticamente inicia sesión en esa cuenta que se acabo de crear.

![image](https://user-images.githubusercontent.com/101755814/198282853-db029d84-e7bd-4d16-a16e-cd61f17fc0ed.png).

- REESTABLECIMIENTO DE CONTRASEÑA:

En el inicio de sesión se muestra una opción "Olvidaste la contraseña".

![image](https://user-images.githubusercontent.com/101755814/198283931-ee9f3992-81cf-4c5e-84fb-7ec5b4bdcaf2.png).

Este TE enviara a la pagina para ingresar el Email al que llegara un correo para reestablecer la contraseña, este tiene un mensaje que pide ingreso de Email, un campo que permitira ingresar este Email y un boton para terminar la operación y enviar el correo, el correo debe estar registrado dentro de las cuentas existentes en la base de datos.

![image](https://user-images.githubusercontent.com/101755814/198284533-61b398c2-b920-4c5a-bb65-35f536204bd0.png).

Cuando acabe de realizar la operación se muestra un mensaje que confirma que el Email ya ha sido enviado y cuenta con la opción para cerrar ese mensaje.

![image](https://user-images.githubusercontent.com/101755814/198284824-fde7d14e-c002-4fdf-83c1-973d60f1c8e6.png).

Nos dirijimos a la cuenta de correo que ingresamos y vamos a Spam ya que el correo llegara alli, como se muestra a continuación nos envio un link en el cual entraremos para el reestablecimiento de contraseña.

![image](https://user-images.githubusercontent.com/101755814/198285283-4a8a34a9-0cff-4169-b2db-c923f95a3bd7.png).

Al entrar al link nos lleva a la pagina en donde cambiaremos la contraseña y nos da un campo para ingresar la contraseña que vamos a actualizar, se le da en save y se guardara y registraran en la base de datos los cambios que realizamos y se mostrara un mensaje de que los cambios se han realizado con exito.

![image](https://user-images.githubusercontent.com/101755814/198285758-ea445436-0e24-44be-956d-681adfe2c889.png), ![image](https://user-images.githubusercontent.com/101755814/198285808-77672dee-2044-4e69-a602-b1a26b2aa0e9.png).

Y por ultimo se revisa la base de datos Firestore en donde se puede ver que estan los usuarios registrados.}

![image](https://user-images.githubusercontent.com/101755814/198286201-c2d7b3db-347a-404a-825e-a0a6290d6d68.png).














