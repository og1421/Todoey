//
//  ViewController.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 13/07/23.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let newItem = Item()
//        newItem.title = "Teste1"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "Teste2"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Teste3"
//        itemArray.append(newItem3)
        
//        loadItems()
    }
    
    //MARK: - Tableview Datasource Methods
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            
            let item = itemArray[indexPath.row]
            
            cell.textLabel?.text = item.title
            
            //Ternary operator ==>
            // value = condition ? valueIfTrue : valueIfFalse
            
            cell.accessoryType = item.done ? .checkmark : .none
            
            return cell
        }
        
        //MARK: - TableView Delegate Methods
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            

    //        context.delete(itemArray[indexPath.row])
    //        itemArray.remove(at: indexPath.row)
            
            itemArray[indexPath.row].done = !itemArray[indexPath.row].done

            saveItems()
            
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
        
        //MARK: - Add New Items
        
        @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
            
            var textField = UITextField()
            
            let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                //what will happen once the user clicks the Add Item button on our UIAlert
                
                
                let newItem = Item(context: self.context)
                newItem.title = textField.text!
                newItem.done = false
//                newItem.parentCategory = self.selectedCategory
                self.itemArray.append(newItem)
                
                self.saveItems()
            }
            
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Create new item"
                textField = alertTextField
                
            }
            
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
        
        //MARK - Model Manupulation Methods
        
        func saveItems() {
            
            do {
              try context.save()
            } catch {
               print("Error saving context \(error)")
            }
            
            self.tableView.reloadData()
        }
        
        func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
            
//            let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//
//            if let addtionalPredicate = predicate {
//                request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
//            } else {
//                request.predicate = categoryPredicate
//            }
//
//
//            do {
//                itemArray = try context.fetch(request)
//            } catch {
//                print("Error fetching data from context \(error)")
//            }
//
//            tableView.reloadData()
            
        }
    
//    func loadItems() {
//        let request : NSFetchRequest<Item> = Item.fetchRequest()
//        do{
//           itemArray =  try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//    }
    
    
}

