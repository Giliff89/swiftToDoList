//
//  CompleteViewController.swift
//  To Do List
//
//  Created by gina iliff on 8/18/17.
//  Copyright © 2017 gina iliff. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()

    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskNameLabel.text = selectedToDo.name
    }
    
    @IBAction func completedTapped(_ sender: Any) {
        
        var index = 0
        
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        
    }
    
}
