//
//  ComicCell.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 24.02.2022.
//

import SwiftUI
import Kingfisher

struct ComicCell: View {
    @ObservedObject var vm : CharacterViewModel = CharacterViewModel()
    
    var comic : ComicsItem
    var body: some View {
        VStack{
            KFImage(vm.comic?.comicPhotoURL)
                .resizable()
                .frame(width: 200, height: 220)
            Text(vm.comic?.title ?? "")
                .frame(width:150)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .onAppear{
            vm.fetchComic(url: comic.resourceURI)
        }
    }
    
}

