//
//  ScoreLogic.swift
//  SwiftBootcampUIKit
//
//  Created by Jose Luis Escolá García on 7/3/24.
//

import Foundation

final class HeroeLogic {
    static let shared = HeroeLogic()
    
    let interactor: HeroeInteractor
    
    var heroes: [Heroe]
    
    init(interactor: HeroeInteractor = HeroeInteractor.shared) {
        self.interactor = interactor
        self.heroes = (try? interactor.getHeroes()) ?? []
    }
    
    func getHeroe(indexPath: IndexPath) -> Heroe {
        heroes[indexPath.row]
    }
    
    func removeHeroe(indexPath: IndexPath) {
        heroes.remove(at: indexPath.row)
    }
    
    func moveHeroe(from: IndexPath, to: IndexPath) {
        heroes.move(fromOffsets: IndexSet(integer: from.row), toOffset: to.row)
    }
}
