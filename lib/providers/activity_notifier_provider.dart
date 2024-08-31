import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/models/Activity.dart';
import '../constants/enum/status_activity.dart';

class ActivityNotifier extends StateNotifier<List<Activity>> {
  ActivityNotifier() : super([]);

  void addActivity(Activity activity) {
    state = [...state, activity];
  }

  void removeActivity(Activity activity) {
    state = state.where((item) => item != activity).toList();
  }

  void updateActivity(int id, Activity updatedActivity) {
    state = [
      for (final activity in state)
        if (activity.id == id) updatedActivity else activity,
    ];
  }

  void updateStatus(int id, Status newStatus) {
    state = [
      for (final activity in state)
        if (activity.id == id)
          activity.copyWith(status: newStatus)
        else
          activity,
    ];
  }
}

// Criação do Provider
final activityProvider =
    StateNotifierProvider<ActivityNotifier, List<Activity>>(
  (ref) => ActivityNotifier(),
);
