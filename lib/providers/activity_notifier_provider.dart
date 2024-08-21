

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/models/Activity.dart';

class ActivityNotifier extends StateNotifier<List<Activity>> {
  ActivityNotifier() : super([]);

  void addActivity(Activity activity) {
    state = [...state, activity];
  }

  void removeActivity(Activity activity) {
    state = state.where((item) => item != activity).toList();
  }




  void updateActivity(Activity updatedActivity, Activity updatedTask) {
    state = [
      for (final activity in state)
        if (activity.id == updatedActivity.id) updatedActivity else activity,
    ];
  }

   
}

// Criação do Provider
final activityProvider = StateNotifierProvider<ActivityNotifier, List<Activity>>(
  (ref) => ActivityNotifier(),
);
