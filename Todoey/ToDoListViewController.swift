//
//  ViewController.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 13/07/23.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Teste1", "Teste2", "Teste3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }


    //MARK: - TableView delegate methods
}

