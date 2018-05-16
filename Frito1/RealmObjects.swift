//
//  RealmObjects.swift
//  
//
//  Created by 野本エリカ on 2018/05/09.
//

import Foundation
import RealmSwift

class Shouhin: Object {
    @objc dynamic var name = ""
    @objc dynamic var category = ""
    @objc dynamic var number: Double = 0.0
    @objc dynamic var id: Int = 1
    
    override static func primaryKey() -> String {
        return "id"
    }
    
}
