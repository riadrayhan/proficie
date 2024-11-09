
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // Map to store selected times for each day
  Map<String, TimeOfDay?> selectedTimes = {
    'Monday': null,
    'Tuesday': null,
    'Wednesday': null,
    'Thursday': null,
    'Friday': null,
    'Saturday': null,
    'Sunday': null,
  };

  @override
  void initState() {
    super.initState();
    loadSavedTimes();
  }

  // Load saved times from SharedPreferences
  Future<void> loadSavedTimes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTimes.forEach((day, _) {
        String? timeString = prefs.getString(day);
        if (timeString != null) {
          List<String> parts = timeString.split(':');
          selectedTimes[day] = TimeOfDay(
            hour: int.parse(parts[0]),
            minute: int.parse(parts[1]),
          );
        }
      });
    });
  }

  // Save times to SharedPreferences
  Future<void> saveTime(String day, TimeOfDay? time) async {
    final prefs = await SharedPreferences.getInstance();
    if (time != null) {
      await prefs.setString(day, '${time.hour}:${time.minute}');
    } else {
      await prefs.remove(day);
    }
  }

  // Reset all times
  Future<void> resetAllTimes() async {
    final prefs = await SharedPreferences.getInstance();
    for (String day in selectedTimes.keys) {
      await prefs.remove(day);
    }
    setState(() {
      selectedTimes.updateAll((key, value) => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reminder Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo[200],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh,color: Colors.white,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Reset All Times'),
                  content: const Text('Are you sure you want to reset all reminder times?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        resetAllTimes();
                        Navigator.pop(context);
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade100, Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: selectedTimes.length,
          itemBuilder: (context, index) {
            String day = selectedTimes.keys.elementAt(index);
            TimeOfDay? time = selectedTimes[day];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      day[0],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  day,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  time != null
                      ? '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
                      : 'No time set',
                  style: TextStyle(
                    color: time != null ? Colors.indigo : Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.access_time,
                    color: Colors.indigo.shade400,
                  ),
                  onPressed: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time ?? TimeOfDay.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Colors.indigo,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (newTime != null) {
                      setState(() {
                        selectedTimes[day] = newTime;
                      });
                      await saveTime(day, newTime);
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}