//
//  ItemModel.swift
//  Todoey
//
//  Created by Orlando Moraes Martins on 15/07/23.
//

import Foundation


class Item: Encodable {
    var title: String = ""
    var done: Bool = false
}
