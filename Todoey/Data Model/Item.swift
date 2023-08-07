//
//  Item.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 02/08/23.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCatagory = LinkingObjects(fromType: Category.self, property: "items")
}
