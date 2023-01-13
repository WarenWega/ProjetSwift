//
//  Todo.swift
//  todolist
//
//  Created by Waren Muguel Mba Wega on 23/11/2022.
//

import Foundation

class Todo {
    
    var description: String
    var nom: String
    var date: Date
    
    init(description: String, nom: String , date: Date) {
        self.description = description
        self.nom = nom
        self.date = date
    }
}
