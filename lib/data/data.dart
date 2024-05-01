import 'dart:math';

class Match_data {
  // Define methods and properties for Match_data class
  // Example:
  // Implement method logic
  Future<List<dynamic>> get_home_page_data(String contestId) async {
   // Example:
    if(contestId=='1278687'){
      return [
        'GT',
        'MI',
        'IN_PROGRESS',
        '2024-04-23 18:00:00',
         'day',
         'Example Series 1'
      ];

    } else if (contestId=='1278688'){
      return [
        'SRH',
        'KKR',
        'IN_PROGRESS',
        '2024-04-24 18:00:00',
        'day',
        'Example Series 2'
      ];

    }else if(contestId=='1278689'){
      return[
        'RR',
        'CSK',
        'IN_PROGRESS',
        '2024-04-25 18:00:00',
        'day',
        'Example Series 3'
      ];
    }
    else if(contestId=='1278690'){
      return[
        'PBKS',
        'RCB',
        'IN_PROGRESS',
        '2024-04-26 18:00:00',
        'day',
        'Example Series 4'
      ];
    }else if(contestId=='1278691') {
      return[
        'LSG',
        'DC',
        'IN_PROGRESS',
        '2024-04-27 18:00:00',
        'day',
        'Example Series 5'
      ];
    } else if(contestId=='1278692'){
      return[
        'MI',
        'KKR',
        'IN_PROGRESS',
        '2024-04-28 18:00:00',
        'day',
        'Example Series 1'
      ];
    }else if(contestId=='1278787'){
      return[
        'MI',
        'KKR',
        'FINISHED',
        '2024-04-20 18:00:00',
        'day',
        'Example Series 7'
      ];
    }else if(contestId == '1278788'){
      return[
        'LSG',
        'DC',
        'IN_PROGRESS',
        '2024-04-27 18:00:00',
        'day',
        'Example Series 5'
      ];
    }else if(contestId == '1278789'){
      return[
        'RR',
        'CSK',
        'IN_PROGRESS',
        '2024-04-25 18:00:00',
        'day',
        'Example Series 3'
      ];
    }
    else
      return [];
  }
  Future<Map<String, List<String>>> get_players_list(String matchId) async {
    // Simulate fetching data from a data source (e.g., API)
    // In this example, we'll return a map containing lists of players categorized by their roles
    // Replace this with your actual data fetching logic

    // Simulate an asynchronous delay to mimic network/database call
    await Future.delayed(Duration(seconds: 2));

    // Generate example data for batsmen, bowlers, wicketkeepers, and allrounders
    final List<String> batsmen = ['Batsman1', 'Batsman2', 'Batsman3'];
    final List<String> bowlers = ['Bowler1', 'Bowler2', 'Bowler3','Bowler4'];
    final List<String> wicketkeepers = ['Wicketkeeper1', 'Wicketkeeper2'];
    final List<String> allrounders = ['Allrounder1', 'Allrounder2', 'Allrounder3','Allrounder4'];

    // Return a map containing lists of players categorized by their roles
    return {
      'batsmen': batsmen,
      'bowlers': bowlers,
      'wicketkeepers': wicketkeepers,
      'allrounders': allrounders,
    };
  }
  Future<int> get_fantasy_points(String playerId) async {
    // Implement your logic to fetch fantasy points for the given player
    // This could involve fetching data from an API or database
    // For demonstration purposes, let's return a random value as fantasy points

    // Simulate an asynchronous delay to mimic network/database call
    await Future.delayed(Duration(seconds: 2));

    // Generate a random value between 0 and 100 as fantasy points
    final int fantasyPoints = Random().nextInt(101);

    // Return the generated fantasy points
    return fantasyPoints;
  }
}
