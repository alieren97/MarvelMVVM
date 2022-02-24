//
//  CharacterViewModel.swift
//  MarvelAppMVVM
//
//  Created by Ali Eren on 20.02.2022.
//

import Foundation
import Combine
import CryptoKit

class CharacterViewModel :ObservableObject{
    @Published var characterList : [Result] = []
    @Published var character : Result?
    @Published var comic : ComicsResult?
    let baseURL = "https://gateway.marvel.com/v1/public/characters?"
    let publicKey = "fe59afe3ab6396b64bd6014053d77e5c"
    let privateKey = "9401a8b177fbe707828f0d9a84fe48a27c1c7d06"
    
    
    
    
    
    
    func fetchData() {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        let url = "https://gateway.marvel.com/v1/public/characters?limit=100&offset=200&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data,_,err) in
            
            
            if let err = err {
                print(err)
                return
                
            }
            guard let APIData = data else {
                print("No data")
                return
            }
            
            do {
                let characters = try JSONDecoder().decode(MarvelResponse.self, from: APIData )
                
                DispatchQueue.main.async {
                    self.characterList = characters.data.results
                    
                    
                }
                
            } catch  let err{
                print(err)
            }
            
            
        }.resume()
        
        
    }
    
    func fetchCharacter(id : Int){
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        let url = "https://gateway.marvel.com/v1/public/characters/\(id)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data,_,err) in
            
            
            if let err = err {
                print(err)
                return
                
            }
            guard let APIData = data else {
                print("No data")
                return
            }
            
            do {
                let characters = try JSONDecoder().decode(MarvelResponse.self, from: APIData )
                
                DispatchQueue.main.async {
                    self.character = characters.data.results.first
                    
                    
                }
                
            } catch  let err{
                print(err)
            }
            
            
        }.resume()
    }
    
    func fetchComic(url:String){
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        let url = "\(url)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        print(url)
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data,_,err) in
            
            
            if let err = err {
                print(err)
                return
                
            }
            guard let APIData = data else {
                print("No data")
                return
            }
            
            do {
                let comic = try JSONDecoder().decode(ComicsAPI.self, from: APIData )
                
                DispatchQueue.main.async {
                    self.comic = comic.data.results.first
                    
                    
                    
                }
                
            } catch  let err{
                print(err)
            }
            
            
        }.resume()
    }
    
    func MD5(data:String)->String{
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format:"%02hhx",$0)
        }
        .joined()
    }
    
    
    
}

