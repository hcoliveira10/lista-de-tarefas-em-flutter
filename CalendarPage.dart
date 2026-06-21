import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'toDoListPage.dart';
import 'login.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime diaFoco = DateTime.now();
  DateTime? diaSel;

  final Map<DateTime, List<Task>> mapaTarefas = {};

  @override
  void initState() {
    super.initState();
    diaSel = diaFoco;
  }

  DateTime limparHora(DateTime d) {
    return DateTime(d.year, d.month, d.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF393E46),
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout, color: Color(0xFF00ADB5)), 
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'PAINEL',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFF393E46),
                        padding: const EdgeInsets.all(8),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: diaFoco,
                          selectedDayPredicate: (day) => isSameDay(diaSel, day),
                          onDaySelected: (sDay, fDay) {
                            setState(() {
                              diaSel = sDay;
                              diaFoco = fDay;
                            });
                          },
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF00ADB5)),
                            rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF00ADB5)),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(color: Colors.white70),
                            weekendStyle: TextStyle(color: Color(0xFF00ADB5)),
                          ),
                          calendarStyle: const CalendarStyle(
                            defaultTextStyle: TextStyle(color: Colors.white),
                            weekendTextStyle: TextStyle(color: Colors.white60),
                            outsideDaysVisible: false,
                            selectedDecoration: BoxDecoration(
                              color: Color(0xFF00ADB5),
                              shape: BoxShape.rectangle, 
                            ),
                            todayDecoration: BoxDecoration(
                              color: Color(0xFF222831),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00ADB5),
                        minimumSize: const Size(double.infinity, 48),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      onPressed: () async {
                        final chaveData = limparHora(diaSel!);
                        if (!mapaTarefas.containsKey(chaveData)) {
                          mapaTarefas[chaveData] = [];
                        }

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ToDoListPage(
                              selectedDate: diaSel!,
                              tasks: mapaTarefas[chaveData]!,
                            ),
                          ),
                        );
                        setState(() {});
                      },
                      child: const Text(
                        'SELECIONAR DATA',
                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}