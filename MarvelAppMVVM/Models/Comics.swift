//
//  Comics.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 24.02.2022.
//

import Foundation

struct ComicsAPI: Codable {
    
    let data: ComicsData
}

struct ComicsData: Codable {
    let results: [ComicsResult]
}


struct ComicsResult : Codable,Identifiable {
    let id : Int
    let digitalId : Int
    let title : String
    let description :String
    let thumbnail : Thumbnail
    
    var comicPhotoURL : URL{
        return URL(string: "\(thumbnail.path).\(thumbnail.thumbnailExtension)")!
    }
}


