//
//  Character.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 20.02.2022.
//

import Foundation

// MARK: - MarvelResponse
struct MarvelResponse: Codable {
    let data: DataClass
    
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [Result]
}




// MARK: - Result
struct Result: Codable,Identifiable {
    let id : Int
    let name : String
    let description : String
    var thumbnail : Thumbnail
    let resourceURI: String
    let comics: Comics
    let stories: Stories
    let events, series: Comics

    enum CodingKeys: String, CodingKey {
        case id, name
        case description
        case resourceURI, thumbnail, comics, stories, events, series
    }
    
    var photoURL : URL{
        return URL(string: "\(thumbnail.path).\(thumbnail.thumbnailExtension)")!
    }
     
}

// MARK: - Comics
struct Comics: Codable{
    let available, returned : Int
    let collectionURI: String
    let items: [ComicsItem]
}

// MARK: - ComicsItem
struct ComicsItem: Codable,Hashable {
    
    let resourceURI, name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available, returned : Int
    let collectionURI: String
    let items: [StoriesItem]
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path, thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type, url: String
}
