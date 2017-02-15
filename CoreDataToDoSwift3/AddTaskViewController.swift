//
//  AddTaskViewController.swift
//  CoreDataToDoSwift3
//
//  Created by Henry Aguinaga on 2016-12-10.
//  Copyright © 2016 Henry Aguinaga. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = textField.text
        task.isImportant = isImp.isOn
        
        // Save data to Core Data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    

}












