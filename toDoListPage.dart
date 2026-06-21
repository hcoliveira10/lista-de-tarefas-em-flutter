import 'package:flutter/material.dart';

class Task {
  String id;
  String title;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class ToDoListPage extends StatefulWidget {
  final DateTime selectedDate;
  final List<Task> tasks;

  const ToDoListPage({
    super.key,
    required this.selectedDate,
    required this.tasks,
  });

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final txtTarefa = TextEditingController();

  @override
  void initState() {
    super.initState();
    ordenar();
  }

  void ordenar() {
    widget.tasks.sort((a, b) {
      if (a.isCompleted == b.isCompleted) {
        return a.title.toLowerCase().compareTo(b.title.toLowerCase());
      }
      return a.isCompleted ? 1 : -1;
    });
  }

  void addTarefa(String nome) {
    if (nome.trim().isEmpty) return;
    setState(() {
      widget.tasks.add(
        Task(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: nome.trim(),
        ),
      );
      ordenar();
    });
    txtTarefa.clear();
  }

  void marcarTarefa(Task t) {
    setState(() {
      t.isCompleted = !t.isCompleted;
      ordenar();
    });
  }

  void removerTarefa(String id) {
    setState(() {
      widget.tasks.removeWhere((item) => item.id == id);
      ordenar();
    });
  }

  void abrirModalAdd() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF393E46),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          title: const Text('NOVA TAREFA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1)),
          content: TextField(
            controller: txtTarefa,
            autofocus: true,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
              fillColor: Color(0xFFEEEEEE),
              filled: true,
              hintText: 'Nome da tarefa',
              border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCELAR', style: TextStyle(color: Colors.white60, fontSize: 12)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00ADB5),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                addTarefa(txtTarefa.text);
                Navigator.pop(context);
              },
              child: const Text('SALVAR', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      }, 
    ); 
  }

  @override
  Widget build(BuildContext context) {
    String dataTxt = "${widget.selectedDate.day.toString().padLeft(2, '0')}/${widget.selectedDate.month.toString().padLeft(2, '0')}/${widget.selectedDate.year}";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF393E46),
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF00ADB5)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'LISTA DE TAREFAS',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1),
                        ),
                        Text(
                          'Data: $dataTxt',
                          style: const TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                      ],
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
                      child: widget.tasks.isEmpty
                          ? const Center(
                              child: Text(
                                'Nenhum registro nesse dia',
                                style: TextStyle(color: Colors.white60, fontSize: 14),
                              ),
                            )
                          : ListView.builder(
                              itemCount: widget.tasks.length,
                              itemBuilder: (context, index) {
                                final task = widget.tasks[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  color: const Color(0xFF393E46),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                                    leading: IconButton(
                                      icon: Icon(
                                        task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                                        color: task.isCompleted ? const Color(0xFF00ADB5) : Colors.white60,
                                        size: 24,
                                      ),
                                      onPressed: () => marcarTarefa(task),
                                    ),
                                    title: Text(
                                      task.title,
                                      style: TextStyle(
                                        fontSize: 14,
                                        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                                        color: task.isCompleted ? Colors.white38 : Colors.white,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.clear, color: Colors.redAccent, size: 20),
                                      onPressed: () => removerTarefa(task.id),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00ADB5),
                        minimumSize: const Size(double.infinity, 48),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      onPressed: abrirModalAdd,
                      icon: const Icon(Icons.add, color: Colors.white, size: 20),
                      label: const Text('ADICIONAR ITEM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)),
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