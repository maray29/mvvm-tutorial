//
//  PeopleViewModel.swift
//  Tutorial-MVVM-001
//
//  Created by Ayk Martirosyan on 28.11.2020.
//

import Foundation

// PeopleViewModel.swift

final class PeopleViewModel: ObservableObject { // to let our view observe changes done by our VM, we have to conform to ObservableObject protocol
    
    @Published var people = [ // Our array of instances of our model
        Person(name: "Player 1", points: 7, illustration: "Illustration-10", skill: "Amateur"),
        Person(name: "Player 2", points: 12, illustration: "Illustration-9", skill: "Professional"),
        Person(name: "Player 3", points: 30, illustration: "Illustration-6", skill: "Expert")
    ]
    
    func incrementPoints(name: String) {
        if let row = self.people.firstIndex(where: {$0.name == name}) {
            people[row].points += 1
        }
    }
    
    func decrementPoints(name: String) {
        if let row = self.people.firstIndex(where: {$0.name == name}) {
            people[row].points -= 1
        }
    }
}
