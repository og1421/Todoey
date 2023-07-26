//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 23/07/23.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var itemCategory = [Categoria]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    //MARK: - Table View Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let item = itemCategory[indexPath.row]
        
        cell.textLabel?.text = itemCategory[indexPath.row].name
        
        
        return cell
        
    }
    
    //MARK: - Data Manipulation Methods
    
    //MARK: - Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    //MARK: - TableView Delegate Methods
    
    
}
