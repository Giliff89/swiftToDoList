//
//  AddToDoViewController.swift
//  To Do List
//
//  Created by gina iliff on 8/18/17.
//  Copyright © 2017 gina iliff. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTaskTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
        
            if let nameText = nameTextField.text {
                toDo.name = nameText
                toDo.important = importantSwitch.isOn
            }
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
    }
}
