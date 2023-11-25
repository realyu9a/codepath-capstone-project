//
//  Task.swift
//

import UIKit

// The Task model
struct Task: Codable, Equatable{

    // The task's title
    var title: String

    // An optional note
    var note: String?
    
    var option: Int
    
    // The due date by which the task should be completed
    var dueDate: Date

    // Initialize a new task
    // `note` and `dueDate` properties have default values provided if none are passed into the init by the caller.
    init(title: String, note: String? = nil, option: Int, dueDate: Date = Date()) {
        self.title = title
        self.note = note
        self.option = option
        self.dueDate = dueDate
    }

    // A boolean to determine if the task has been completed. Defaults to `false`
    var isComplete: Bool = false {

        // Any time a task is completed, update the completedDate accordingly.
        didSet {
            if isComplete {
                // The task has just been marked complete, set the completed date to "right now".
                completedDate = Date()
            } else {
                completedDate = nil
            }
        }
    }

    // The date the task was completed
    // private(set) means this property can only be set from within this struct, but read from anywhere (i.e. public)
    private(set) var completedDate: Date?

    // The date the task was created
    // This property is set as the current date whenever the task is initially created.
    var createdDate: Date = Date()

    // An id (Universal Unique Identifier) used to identify a task.
    var id: String = UUID().uuidString
}

// MARK: - Task + UserDefaults
extension Task {
    static var taskKey: String {
        return "task"
    }

    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ tasks: [Task]) {

        // TODO: Save the array of tasks
        
        let defaults = UserDefaults.standard
        let encodedTasks = try! JSONEncoder().encode(tasks)
        defaults.set(encodedTasks, forKey: Task.taskKey)
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getTasks() -> [Task] {
//        resetDefaults()
        // TODO: Get the array of saved tasks from UserDefaults
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: Task.taskKey){
            let decodedTask = try! JSONDecoder().decode([Task].self, from: data)
            return decodedTask
        } else{
            return [] // 👈 replace with returned saved tasks
        }
    }
    
    static func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }

    // Add a new task or update an existing task with the current task.
    func save() {

        // TODO: Save the current task
        var tasks = Task.getTasks()
        
        if let i = tasks.firstIndex(where: { $0.id == self.id}) {
            tasks.remove(at: i)
            tasks.insert(self, at: i)
        } else {
            tasks.append(self)
        }
        Task.save(tasks)
    }
}
