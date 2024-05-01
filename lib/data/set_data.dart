import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import for Random class

class Set_Data {
  // Method to get the number of joined teams
  Future<String> get_joined_teams_num(String matchId) async {
    try {
      // Initialize Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query Firestore to count the number of documents in the 'Teams' collection
      QuerySnapshot teamsSnapshot = await firestore
          .collection('Contest')
          .doc(matchId)
          .collection('Teams')
          .get();

      // Get the number of documents in the snapshot
      int teamsNum = teamsSnapshot.size;

      // Convert integer to string and return
      return teamsNum.toString();
    } catch (e) {
      // Handle any errors
      print('Error fetching joined teams count: $e');
      return '0'; // Return 0 in case of error
    }
  }

  // Method to get the references of joined teams
  Future<List<String>> get_joined_teams_ref(String matchId) async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Initialize Firestore
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Query Firestore to fetch team IDs associated with the current user and match ID
        QuerySnapshot teamsSnapshot = await firestore
            .collection('Contest')
            .doc(matchId)
            .collection('Teams')
            .where('Team', isEqualTo: firestore.doc('Users/${currentUser.uid}/Fantasy_Team/$matchId/${currentUser.email} Team1'))
            .get();

        // Extract team IDs from the snapshot
        List<String> teamIds = teamsSnapshot.docs.map((doc) => doc.id).toList();

        // Return the list of team IDs
        return teamIds;
      } else {
        // User not logged in
        print("user not found");
        return [];
      }
    } catch (e) {
      // Handle any errors
      print('Error fetching team IDs: $e');
      return []; // Return an empty list in case of error
    }
  }
  Future<List<String>> get_joined_contest() async {
    // Simulate fetching data from a data source (e.g., API)
    // In this example, we'll return a list of joined contests
    // Replace this with your actual data fetching logic

    // Simulate an asynchronous delay to mimic network/database call
    await Future.delayed(Duration(seconds: 2));

    // Generate a list of joined contests (example data)
    final List<String> joinedContests = ['1278787', '1278788', '1278789']; // Example contest names
    return joinedContests;
  }
  Future<String> get_team_num(String matchId) async {
    // Implementation of get_team_num method
    // For example:
    // Query the Firestore to get the team number based on the match ID
    // Return the team number as a String
    return "team123"; // Replace with actual implementation
  }

  Future<void> set_team_data(String teamNum, String matchId, List<String> players, String cName, String vcName, List<String> wicketkeeper, List<String> batsmen, List<String> allrounders, List<String> bowlers) async {
    // Implementation of set_team_data method
    //
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final FirebaseAuth _auth = FirebaseAuth.instance;
      Map<String, dynamic> teamData = {
        'Team_Num': teamNum,
        'Match_Id': matchId,
        'Players': players,
        'Captain_Name': cName,
        'Vice_Captain_Name': vcName,
        'Wicketkeepers': wicketkeeper,
        'Batsmen': batsmen,
        'Allrounders': allrounders,
        'Bowlers': bowlers,
        // Add more fields as needed
      };
      DocumentReference teamRef = _firestore.collection('Users').doc(_auth.currentUser?.uid)
          .collection('Fantasy_Team').doc(matchId).collection('Teams').doc();
      await teamRef.set(teamData);
      // Remember to handle any errors and exceptions
    }catch(e){
      print("Error upload data $e");
    }
  }
  Future<List<String>> get_user_data() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    List<String> userData = [];

    try {
      // Replace 'Users' with the actual collection name in your Firestore database
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('Users').doc(_auth.currentUser?.uid).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        String name = data['name'] ?? '';
        String phone = data['phone'] ?? '';

        userData = [name, phone];
      }
    } catch (e) {
      print('Error getting user data: $e');
    }

    return userData;
  }
}
