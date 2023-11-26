import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tnpd/domain/models/turno.dart';

class TurnoRepositroy {


  Future<List<Turno>> getTurnos() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference ac = firestore.collection("turnos");
    // This is dart code. 
    final querySnapshot = await ac.get();
    final printt = querySnapshot.docs.map((e) => Turno.fromJson(e.data() as Map<String, dynamic>)).toList();

    

    return printt;
  }
}
