//
//  TaskTableViewController.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 9/3/24.
//

import UIKit

class TaskTableViewController: UITableViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    private var showCompletedTasks = false
    private var tasks: [(title: String, completed: Bool)] = [
        (title: "1 sdadfad afasdc", completed: false),
        (title: "2 sdadfad afasdc", completed: true),
        (title: "3 sdadfad afasdc", completed: false)
    ]
    
    private var openTasks:[(title: String, completed: Bool)] {
        tasks.filter { !$0.completed }
    }
    
    private var displayedTaskList: [(title: String, completed: Bool)] {
        showCompletedTasks ? tasks : openTasks
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        updateProgressBar()
    }
    
    private func updateProgressBar() {
        let totalTasks = tasks.count
        let completedTasks = tasks.filter({ $0.completed }).count
        let progress = totalTasks > 0 ? Float(completedTasks) / Float(totalTasks) : 0
        progressBar.setProgress(progress, animated: true)
    }
    
    @IBAction func completeAll(_ sender: Any) {
        tasks = tasks.map({ (title, _) in (title: title, completed: true) })
        refreshTable(updateProgress: true)
    }
    
    @IBAction func showCompletedTasks(_ sender: Any) {
        showCompletedTasks = true
        refreshTable()
    }
    
    
    @IBAction func hideCompletedTasks(_ sender: Any) {
        showCompletedTasks = false
        refreshTable()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedTaskList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        let task = displayedTaskList[indexPath.row]
        cell.textField.text = task.title

        if task.completed {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: task.title)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            cell.textField.attributedText = attributeString

            cell.completedTaskSwitch.setOn(true, animated: false) // assuming there is a UISwitch named taskSwitch in your TaskTableViewCell
        } else {
            cell.textField.attributedText = nil
            cell.textField.text = task.title
            cell.completedTaskSwitch.setOn(false, animated: false)
        }

        return cell
    }

    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func refreshTable(updateProgress: Bool = false) {
        tableView.reloadData()
        if updateProgress {
            updateProgressBar()
        }
    }

}

extension TaskTableViewController: SwitchDelegate {
    func switchStateChanged<T>(_ cell: T, newState: Bool) where T: UITableViewCell {
        guard let displayedRow = tableView.indexPath(for: cell)?.row else { return }

        // Update tasks array
        let taskTitle = displayedTaskList[displayedRow].title
        if let taskIndex = tasks.firstIndex(where: { $0.title == taskTitle }) {
            tasks[taskIndex].completed = newState
        }
        refreshTable(updateProgress: true)
    }
}
