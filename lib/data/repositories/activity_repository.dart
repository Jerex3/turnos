

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tnpd/domain/models/activity.dart';

class ActivityRepository {
  
  static Future<List<Activity>> getActivities() async {
    
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    
    CollectionReference ac = firestore.collection("activity");
    
    final querySnapshot = await ac.get();
    Activity a = Activity.fromJson(querySnapshot.docs[0].data() as Map<String, dynamic>);
    print(a.name);
    return [];


  }
}