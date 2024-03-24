//
//  DataInteractor.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 10/3/24.
//

import UIKit

struct PlayerInteractor: PlayerInteractorProtocol {
    static let shared = PlayerInteractor()
    
    let apps: [PlayerAppSelectorViewModel] = [
        PlayerAppSelectorViewModel(
            title: "Weather view",
            backgroundImage: UIImage(
                named: "weatherBackground"
            ),
            segueId: "weatherApp"
        ),
        PlayerAppSelectorViewModel(
            title:"Task list",
            backgroundImage: UIImage(
                named: "tasksBackground"
            ),
            segueId: "TaskListApp"
        ),
        PlayerAppSelectorViewModel(
            title:"Profile",
            backgroundImage: UIImage(
                named: "profileBackground"
            ),
            segueId: "ProfileView"
        ),
        PlayerAppSelectorViewModel(
            title:"Superheroes",
            backgroundImage: UIImage(
                named: "heroesBackground"
            ),
            segueId: "HeroesApp"
        )
        
    ]
    
    private init() {}
    
    func getPlayerOptions() -> [PlayerAppSelectorViewModel] {
        apps
    }
}

protocol PlayerInteractorProtocol {
    func getPlayerOptions() -> [PlayerAppSelectorViewModel]
}
