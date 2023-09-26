import Foundation

protocol Task {
    var title: String { get set }
    var description: String? { get set }
    var status: TaskStatus { get set }
    
    mutating func markAsCompleted()
}

enum TaskStatus {
    case todo, inProgress, done
}

class BasicTask: Task {
    var title: String
    var description: String?
    var status: TaskStatus = .todo
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
    }
    
    func markAsCompleted() {
        status = .done
    }
}

var taskList: [Task] = []

taskList.append(BasicTask(title: "Ler um livro", description: "Termine o último capítulo"))
taskList.append(BasicTask(title: "Fazer compras"))
taskList.append(BasicTask(title: "Fazer exercícios"))

func listTasks() {
    for task in taskList {
        print("Tarefa: \(task.title), Status: \(task.status)")
    }
}

let completeTask: (Int) -> Void = { index in
    if index >= 0 && index < taskList.count {
        taskList[index].markAsCompleted()
    }
}

print("Lista de tarefas inicial:")
listTasks()

completeTask(0)
print("\nMarcando a primeira tarefa como concluída:")
listTasks()

completeTask(2)
print("\nMarcando a terceira tarefa como concluída:")
listTasks()
