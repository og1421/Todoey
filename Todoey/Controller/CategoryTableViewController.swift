//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 23/07/23.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    let realm = try! Realm()
    
    var itemCategory = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()

    }
        
    //MARK: - Table View Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let item = itemCategory[indexPath.row]
        
        cell.textLabel?.text = item.name
        self.tableView.reloadData()
        
        return cell
        
    }
    
    //MARK: - Data Manipulation Methods
    func save(_ category: Category) {
        do {
            try realm.write{
                realm.add(category)
            }
        } catch {
            print("Error saving context: \(error)")
        }
        self.tableView.reloadData()
    }
    
    func load() {
        
//
//        do {
//            itemCategory = try context.fetch(request)
//        } catch {
//            print("error fetching data from context: \(error)")
//        }
//
//        tableView.reloadData()
    }
    
    //MARK: - Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category()
            
            newCategory.name = textField.text!
            
            self.itemCategory.append(newCategory)
            
            self.save(newCategory)
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            field.placeholder = "Create new category"
            textField = field
            
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC  = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedCategory = itemCategory[indexPath.row]
            print("teste")
        }
    }
    
}
