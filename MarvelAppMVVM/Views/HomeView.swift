//
//  ContentView.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 20.02.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm : CharacterViewModel = CharacterViewModel()
    
    var body: some View {
        VStack{
            mainContent
            
        }
        .navigationTitle("Marvel")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
       
    }
}

extension HomeView{
    private var mainContent : some View{
        VStack(alignment:.leading){
            Text("Characters")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    ForEach(vm.characterList){character in
                        NavigationLink {
                            CharacterDetailView(id:character.id)
                        } label: {
                            MarvelCharacterCell(character:character)
                        }

                        
                    }
                }
               
            }.onAppear {
                vm.fetchData()
            }
        }
    }
}
