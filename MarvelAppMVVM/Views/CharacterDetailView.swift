//
//  CharacterDetailView.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 24.02.2022.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    @ObservedObject var vm : CharacterViewModel = CharacterViewModel()
    
    let id : Int
    var body: some View {
        ScrollView{
            
            VStack{
                KFImage(vm.character?.photoURL ?? URL(string: ""))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                Text(vm.character?.name ?? "")
                    .font(.title).fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(width:250)

                comicsView
               
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            vm.fetchCharacter(id: id)
        }
        
        
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CharacterDetailView(id:1010914)
        }
    }
}


extension CharacterDetailView {
    private var comicsView :some View{
        VStack(alignment:.leading){
            Text("Comics")
            
                .font(.title)
                .fontWeight(.bold)
               
            vm.character?.comics.items == [] ?
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(vm.character?.comics.items ?? [], id: \.self){comic in
                        ComicCell(comic: comic)
                        
                    }
                }
                
            } : nil
        }
        .padding(.horizontal)
    }
}
