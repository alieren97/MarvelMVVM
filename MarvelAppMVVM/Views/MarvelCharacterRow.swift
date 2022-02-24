//
//  MarvelCharacterRow.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 22.02.2022.
//

import SwiftUI
import Kingfisher

struct MarvelCharacterCell: View {
    
    let character : Result
    
     
    var body: some View {
        HStack(alignment:.center,spacing:10){
            KFImage(character.photoURL)
                .resizable()
                .frame(width: 175, height: 175)
                .cornerRadius(10)
            Text(character.name)
                .frame(width:150)
                .font(.system(size:20,weight: .bold))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
    }
}




