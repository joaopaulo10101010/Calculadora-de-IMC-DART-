import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: IMC(), debugShowCheckedModeBanner: false,));
}

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {

  double resultadoIMC = 0;
  double peso = 5;
  double altura = 10;

  final TextEditingController controlepeso = TextEditingController();
  final TextEditingController controlealt = TextEditingController();

  void Calcular(){
    setState(() {
    String textopeso = controlepeso.text;
    String textoalt = controlealt.text;

    altura = double.parse(textoalt);
    peso = double.parse(textopeso);
    resultadoIMC = peso/(altura*altura);  
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, backgroundColor: Colors.green,title: Text("Calculadora IMC",style: TextStyle(color: Colors.white),),),
    
    body: Container(padding: EdgeInsets.all(10),child: Column(children: [
    Icon(Icons.person,size: 100,color: Colors.orange,),
    Row(children: [Text("Altura",style: TextStyle(fontWeight: FontWeight.bold),)]),
    TextField(controller: controlealt,decoration: InputDecoration(hintText: "1.8 (Valor em Metros 1m 80cm)",),),
    Row(children: [Text("Peso",style: TextStyle(fontWeight: FontWeight.bold),)],),
    TextField(controller: controlepeso,decoration: InputDecoration(hintText: "50 (Valor em Peso 50Kg)"),),
    SizedBox(height: 10,),
    TextButton(onPressed: Calcular,style: TextButton.styleFrom(shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0)),backgroundColor: Colors.green,fixedSize: Size(400, 40)), child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize: 20),),),
    SizedBox(height: 10,),
    Text((resultadoIMC<=0)?"Calcule seu IMC": (resultadoIMC<18.5)?"Seu peso esta abaixo da media: IMC ${resultadoIMC.toString()}": (resultadoIMC<24.9)? "Seu peso esta na media: IMC ${resultadoIMC.toString()}":"Você esta acima do peso: IMC ${resultadoIMC.toString()}")],),),
    
    );
  }
}