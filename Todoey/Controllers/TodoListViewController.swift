//
//  ViewController.swift
//  Todoey
//
//  Created by Carlos Lozano on 2/3/18.
//  Copyright © 2018 Carlos Lozano. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray: [Item] = []
    var defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items : [Item] = defaults.array(forKey: "itemArray") as! [Item]!{
            itemArray = items
        } else{
            itemArray = []
            print("unable to find items array")
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        let item = itemArray[indexPath.row]
        item.done = !(item.done)
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addNewItemPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add new ToDoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) {
            (action) in
            guard let textFieldValue : String = alert.textFields?.first?.text else {
                print("unable to assign value")
                return
            }
            
            self.itemArray.append(Item(title: textFieldValue, done: false))
            self.defaults.set(self.itemArray, forKey: "itemArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Create new item"
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
}

