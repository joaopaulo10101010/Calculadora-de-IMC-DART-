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

  void calcular(){
    setState(() {
    String textopeso = controlepeso.text;
    String textoalt = controlealt.text;

    if(textoalt != ""){
      altura = double.parse(textoalt);
    }else{
      altura = 0;
    }
    if(textopeso != ""){
      peso = double.parse(textopeso);
    }else{
      peso = 0;
    }
    
    resultadoIMC = peso/(altura*altura);  
    }); 
  }
  void recaregar(){
    setState(() {
       controlepeso.text = "";
       controlealt.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, backgroundColor: Colors.green,title: Text("Calculadora IMC",style: TextStyle(color: Colors.white),),actions: [IconButton(onPressed: recaregar, icon: Icon(Icons.refresh,color: Colors.white,))]),
    
    body: Container(padding: EdgeInsets.all(10),child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
    Icon(Icons.person_outline,size: 120,color: Colors.green,),
    TextField(textAlign: TextAlign.center,keyboardType: TextInputType.number,controller: controlealt,decoration: InputDecoration(labelText: 'Altura',hintText: "1.8 (Valor em Metros 1m 80cm)",labelStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),),
    TextField(textAlign: TextAlign.center,keyboardType: TextInputType.number,controller: controlepeso,decoration: InputDecoration(labelText: 'Peso',hintText: "50 (Valor em Peso 50Kg)",labelStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),),
    SizedBox(height: 10,),
    ElevatedButton(onPressed: calcular,style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0)),backgroundColor: Colors.green,), child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize: 20),),),
    SizedBox(height: 10,),
    Text(style: TextStyle(fontSize: 18,color: Colors.green),textAlign: TextAlign.center,(resultadoIMC<=0)?"Informação": (resultadoIMC<18.5)?"Seu peso esta abaixo da media: IMC ${resultadoIMC.toString()}": (resultadoIMC<24.9)? "Seu peso esta na media: IMC ${resultadoIMC.toString()}":"Você esta acima do peso: IMC ${resultadoIMC.toString()}")],),),
    
    );
  }
}