//
//  ViewController.swift
//  CoreDataToDoSwift3
//
//  Created by Henry Aguinaga on 2016-12-10.
//  Copyright © 2016 Henry Aguinaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        // get data from Core Data
        
        getData()
        
        // reload the view
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.isImportant {
            cell.textLabel?.text = "😨\(task.name!)"
        }else {
            cell.textLabel?.text = task.name!
            
        }
        
        return cell
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try tasks = context.fetch(Task.fetchRequest())
        }
        catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                try tasks = context.fetch(Task.fetchRequest())
            }
            catch {
                print(error)
            }

        }
        tableView.reloadData()
    }

}

