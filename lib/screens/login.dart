import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Color myColor;
  late Size mySize;
  late bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    // Deerminamos el color primario
    myColor = Theme.of(context).primaryColor;
    mySize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
              image: const AssetImage('assets/images/fondo.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  myColor.withOpacity(0.6), BlendMode.dstATop))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Aqui estaran las partes del formulario
            Positioned(top: 60, child: _parteSuperior()),
            Positioned(
              bottom: 0,
              child: _parteInferior(),
            )
          ],
        ),
      ),
    );
  }

  Widget _parteSuperior() {
    return SizedBox(
      width: mySize.width,
      child: const Column(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.white,
            size: 100,
          ),
          Text(
            'GO MAP',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _parteInferior() {
    return SizedBox(
      width: mySize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: _miFormulario(),
      ),
    );
  }

  Widget _miFormulario() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
                color: myColor, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          _tipoTextoPlomo("Please login with your information"),
          const SizedBox(
            height: 40,
          ),
          _tipoTextoPlomo("Email"),
          _tipoInputField(const Icon(Icons.done)),
          const SizedBox(
            height: 40,
          ),
          _tipoTextoPlomo("Email"),
          _tipoInputField(const Icon(Icons.remove_red_eye)),
          const SizedBox(
            height: 20,
          ),
          _olvideContrasena(),
          const SizedBox(
            height: 20,
          ),
          _botonLogin(),
          const SizedBox(
            height: 10,
          ),
          _tipoTextoCentrado("Or login with"),
          const SizedBox(
            height: 10,
          ),
          _redesSociales()
        ],
      ),
    );
  }

  Widget _tipoTextoPlomo(String texto) {
    return Text(
      texto,
      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
    );
  }

  Widget _tipoTextoCentrado(String texto) {
    return Center(
      child: Text(
        texto,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _tipoInputField(Icon icon) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: icon,
      ),
    );
  }

  Widget _olvideContrasena() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isChecked,
              activeColor: myColor,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            _tipoTextoPlomo("Remember me"),
          ],
        ),
        _tipoTextoPlomo("I forgot my password"),
      ],
    );
  }

  Widget _botonLogin() {
    return SizedBox(
      width: double.infinity, // Ocupa todo el ancho disponible
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 15, 
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Text('LOGIN', style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
        onPressed: () {
          // Función a ejecutar al presionar el botón
        },
      ),
    );
  }

  Widget _redesSociales() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/facebook.png',
          width: 40,
          height: 40,
        ), // Utiliza Image.asset para cargar imágenes desde el directorio de activos
        Image.asset(
          'assets/images/twitter.png',
          width: 40,
          height: 40,
        ),
        Image.asset(
          'assets/images/github.png',
          width: 40,
          height: 40,
        ),
      ],
    );
  }
}
