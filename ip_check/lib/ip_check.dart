//https://api.ipify.org
// import "dart:convert";
//import "package:http/http.dart" as http;   //pacchetto importato

// const StringUrl = "https://api.ipify.org?format=json";

// // devo mettere future perche string non puo lavorare da solo perche non è asincorno
// Future <Ip> getIp() async{                                       //API SERVIZIO INTENET CHE AD UN DETERMIBNATO URL MI RESTITUISCE DEI DATI QUA OTTENDO IP PUBBLICO
//   final url = Uri.parse(StringUrl);      //traduco URL, PARSE METODO FA paret di Uri classe, si traduce in un oggetto URI
//   final res= await http.get(url);
//   final Map<String, dynamic> data =json.decode(res.body);               //faccio la chiamata, metodo get, richiesta get che mi da l'indirizzo ip
//   return Ip(ip: data ['ip']);                                         //le due chiavi async await fanno si che tutto diventi asincrono fai partire la chiamata quandfo la chiamata torna mi dici che ho i dati
//                                                           //await fai quello che devi afre e poi vieni da me async perchè all'interno ce await dnetro ha del codice che richiede che tu aspetti
// }

// class Ip {
//   String ip;
//   String region;
//   String postal;
//   String city;

//   Ip({required this.ip,
//   required this.region,
//   required this.postal,
//   required this.city,
//   });

//   @override
//   String toString() {
//     return ip;
//   }
// }

//API SERVIZIO INTENET CHE AD UN DETERMIBNATO URL MI RESTITUISCE DEI DATI QUA OTTENDO IP PUBBLICO
//traduco URL, PARSE METODO FA paret di Uri classe, si traduce in un oggetto URI
//faccio la chiamata, metodo get, richiesta get che mi da l'indirizzo ip
//le due chiavi async await fanno si che tutto diventi asincrono fai partire la chiamata quandfo la chiamata torna mi dici che ho i dati
//await fai quello che devi afre e poi vieni da me async perchè all'interno ce await dnetro ha del codice che richiede che tu aspetti

// ignore_for_file: public_member_api_docs, sort_constructors_first
// https://api.ipify.org

import 'dart:convert';

class Ip {
  String ip;
  String region;
  String postal;
  String city;

  Ip({
    required this.ip,
    required this.region,
    required this.postal,
    required this.city,
  });

  @override
  String toString() {
    return "My ip is: $ip region: $region, postal $postal, city: $city";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ip': ip,
      'region': region,
      'postal': postal,
      'city': city,
    };
  }

  factory Ip.fromMap(Map<String, dynamic> map) {
    return Ip(
      ip: map['ip'] as String,
      region: map['region'] as String,
      postal: map['postal'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ip.fromJson(String source) =>
      Ip.fromMap(json.decode(source) as Map<String, dynamic>);
}
