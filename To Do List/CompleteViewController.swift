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
    var selectedToDo : ToDoCoreData?

    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskNameLabel.text = selectedToDo?.name
    }
    
    @IBAction func completedTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let theToDo = selectedToDo {
                context.delete(theToDo)
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        }
    }    
}
