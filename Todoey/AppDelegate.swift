//
//  AppDelegate.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 13/07/23.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do{
            let realm = try Realm()
            
        } catch {
            print("Error initializing realm: \(error)")
        }
        
        return true
    }


    func applicationWillTerminate(_ application: UIApplication) {

//        self.saveContext()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        // Adicione esse código ao criar a instância do NSPersistentContainer
        let container = NSPersistentContainer(name: "CoreDataModel2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Tratar o erro ao carregar o armazenamento persistente aqui
                fatalError("Erro ao carregar o armazenamento persistente: \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }



}
