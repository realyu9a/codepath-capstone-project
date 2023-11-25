//
//  FoodViewController.swift
//  FitFolio..
//
//  Created by Yuga Suzuki on 11/18/23.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    @IBOutlet weak var options: UISegmentedControl!
    
    @IBAction func changeOption(_ sender: UISegmentedControl) {
        switch options.selectedSegmentIndex
        {
        case 0:
            refreshTasks()
            //show popular view
        case 1:
            refreshTasks()
            //show history view
        case 2:
            refreshTasks()
            //show history view
        default:
            break;
        }

    }
    
    // The main tasks array initialized with a default value of an empty array.
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapNewTaskButton))
        // Hide top cell separator
//        tableView.tableHeaderView = UIView()

        // Set table view data source
        // Needed for standard table view setup:
        //    - tableView(numberOfRowsInSection:)
        //    - tableView(cellForRowAt:)
        // Also for swipe to delete row:
        //    - tableView(_:commit:forRowAt:)
        
        tableView.dataSource = self

        // Set table view delegate
        // Needed to detect row selection: tableView(_:didSelectRowAt:)
        tableView.delegate = self
    }

    
    
    // Refresh the tasks list each time the view appears in case any tasks were updated on the other tab.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshTasks()
    }

    // When the "+" button is tapped, perform the segue with id, "ComposeSegue".
    @IBAction func didTapNewTaskButton(_ sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ComposeSegue" {
            if let composeNavController = segue.destination as? UINavigationController,
               let composeViewController = composeNavController.topViewController as? TaskComposeViewController {

                composeViewController.taskToEdit = sender as? Task

                composeViewController.onComposeTask = { [weak self] task in
                    task.save()
                    self?.refreshTasks()
                }
            }
        }
    }

    private func refreshTasks() {
        var tasks = Task.getTasks()
        tasks.removeAll(where: {$0.option != options.selectedSegmentIndex})
        tasks.sort { lhs, rhs in
            if lhs.isComplete && rhs.isComplete {
                return lhs.completedDate! < rhs.completedDate!
            } else if !lhs.isComplete && !rhs.isComplete {
                return lhs.createdDate < rhs.createdDate
            } else {
                return !lhs.isComplete && rhs.isComplete
            }
        }
        self.tasks = tasks
        emptyStateLabel.isHidden = !tasks.isEmpty
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}

extension FoodViewController: UITableViewDataSource {

    // The number of rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        // 2.
        let task = tasks[indexPath.row]
        // 3.
        cell.configure(with: task, onCompleteButtonTapped: { [weak self] task in
            // i.
            task.save()
            // ii.
            self?.refreshTasks()
        })
        // 4.
        return cell
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            tasks.remove(at: indexPath.row)
            // 3.
            Task.save(tasks)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - Table View Delegate Methods

// An extension to group all table view delegate related methods
extension FoodViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1.
        tableView.deselectRow(at: indexPath, animated: false)
        // 2.
        let selectedTask = tasks[indexPath.row]
        // 3.
        performSegue(withIdentifier: "ComposeSegue", sender: selectedTask)
    }
}
