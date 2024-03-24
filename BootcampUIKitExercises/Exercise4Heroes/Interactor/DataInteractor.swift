//
//  DataInteractor.swift
//  SwiftBootcampUIKit
//
//  Created by Jose Luis Escolá García on 7/3/24.
//

import Foundation

struct HeroeInteractor: DataInteractor, JSONLoader {
    static let shared = HeroeInteractor()
    
    private init() {}
    
    func getHeroes() throws -> [Heroe] {
        guard let url = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json") else { return [] }
        return try getJSON(url: url, type: [Heroe].self)
    }
}

protocol DataInteractor {
    func getHeroes() throws -> [Heroe]
}

