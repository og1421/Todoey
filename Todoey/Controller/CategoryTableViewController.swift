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
        
        loadItems()

    }
        
    //MARK: - Table View Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let item = itemCategory[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        
        return cell
        
    }
    
    //MARK: - Data Manipulation Methods
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
            self.tableView.reloadData()
        }
    }
    
    func loadItems(with request: NSFetchRequest<Categoria> = Categoria.fetchRequest()) {
        
        
        do {
            itemCategory = try context.fetch(request)
        } catch {
            print("error fetching data from context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    //MARK: - Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Categoria(context: self.context)
            
            newCategory.name = textField.text!
            
            self.itemCategory.append(newCategory)
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
