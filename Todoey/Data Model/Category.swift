//
//  Category.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 02/08/23.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
