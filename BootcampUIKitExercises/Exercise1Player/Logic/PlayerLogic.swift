//
//  PlayerLogic.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 10/3/24.
//

import Foundation

final class PlayerLogic {
    static let shared = PlayerLogic()
    
    let interactor: PlayerInteractor = PlayerInteractor.shared
    
    var apps: [PlayerAppSelectorViewModel]
    private var selectedAppIndex: Int = 0
    
    private init() {
        apps = interactor.getPlayerOptions()
    }
    
    func getPreviousOptionIndex() -> NSIndexPath? {
        let newIndex = selectedAppIndex-1
        guard newIndex >= 0 else { return nil }
        selectedAppIndex = newIndex
        let indexPath = NSIndexPath(item: newIndex, section: 0)
        return indexPath
    }
    
    func getNextOptionIndex() -> NSIndexPath? {
        let newIndex = selectedAppIndex+1
        guard apps.count-1 >= newIndex else { return nil }
        selectedAppIndex = newIndex
        let indexPath = NSIndexPath(item: newIndex, section: 0)
        return indexPath
    }
    
    func getSelectedOptionSegue() -> String {
        apps[selectedAppIndex].segueId
    }
    
    func getNumberOfOptions() -> Int {
        apps.count
    }
    
    func getOption(for indexPath: IndexPath) -> PlayerAppSelectorViewModel {
        apps[indexPath.row]
    }
}
