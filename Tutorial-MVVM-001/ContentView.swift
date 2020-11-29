//
//  ContentView.swift
//  Tutorial-MVVM-001
//
//  Created by Ayk Martirosyan on 28.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            PeopleView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
