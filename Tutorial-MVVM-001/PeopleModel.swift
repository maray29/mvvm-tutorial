//
//  PeopleModel.swift
//  Tutorial-MVVM-001
//
//  Created by Ayk Martirosyan on 28.11.2020.
//

import Foundation

struct Person: Identifiable { // Our model with the data as its properties
    let id = UUID()
    var name: String
    var points: Int
    let illustration: String
    var skill: String
}


