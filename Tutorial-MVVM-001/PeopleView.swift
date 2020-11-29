//
//  PeopleView.swift
//  Tutorial-MVVM-001
//
//  Created by Ayk Martirosyan on 28.11.2020.
//

import SwiftUI

struct PeopleView: View {
    
    @StateObject var viewModel = PeopleViewModel()  // The VM is initialized
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.people) { person in
                    CardHorizontal(viewModel: viewModel, person: person)
                        .frame(maxHeight: 220)
                }
            }
            .padding()
            .foregroundColor(.primary)
            
        }
        .navigationTitle("Players")
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PeopleView()
        }
    }
}

    struct CardHorizontal: View {
        
        @ObservedObject var viewModel: PeopleViewModel
        var person: Person
        @State var showPlayersSkill = false // Mini ViewModel. When it is changed to true, the view will be updated
        
        var body: some View {
            ZStack(alignment: .top) {
                
                HStack {
                    Spacer()
                    Image(person.illustration)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            withAnimation() {
                                showPlayersSkill.toggle()
                            }
                        }) {
                            RoundIconButton(icon: "chevron.down", hasShadow: false)
                                .rotationEffect(showPlayersSkill ? .degrees(-180) : .degrees(0)) // We can also use @State vars to conditionally apply effects
                        }
                    }
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Spacer()
                        HStack {
                            Text(person.name)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.primary)
                        
                        HStack {
                            Text("Points: ")
                            Text("\(person.points)")
                            Spacer()
                            
                            Button(action: {
                                 viewModel.decrementPoints(name: person.name)
                            }) {
                                RoundIconButton(icon: "minus")
                            }
                            
                            Button(action: {
                                viewModel.incrementPoints(name: person.name)
                            }) {
                                RoundIconButton(icon: "plus")
                            }
                        }
                        .foregroundColor(.primary)
                        
                        if showPlayersSkill { // Once showPlayersSkill is true, this block of code will be shown
                            HStack {
                                Text(person.skill)
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
                .padding(.bottom)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.primary.opacity(0.3), lineWidth: 0.5)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.15), radius: 15, x: 5, y: 15)
        }
    }

struct RoundIconButton: View {
    var icon: String
    var color: Color = Color.white
    var hasShadow: Bool = true
    var width: CGFloat = 44
    var height: CGFloat = 44
    var fontSize: CGFloat = 16
    var weight: Font.Weight = .regular
    
    var body: some View {
        ZStack {
            Image(systemName: icon)
                .font(Font.body.weight(.bold))
                .foregroundColor(.primary)
                .frame(width: 44, height: 44)
                .background(color)
                .clipShape(Circle())
        }
        
        .shadow(color: hasShadow ? Color.black.opacity(0.2) : Color.clear, radius: 10, x: 3, y: 10)
    }
}
