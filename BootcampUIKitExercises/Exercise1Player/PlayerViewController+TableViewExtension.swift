//
//  PlayerViewController+TableViewExtension.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 9/3/24.
//

import UIKit

extension PlayerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.playerInteractor.getNumberOfOptions()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "appSelectorCell", for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        let option = self.playerInteractor.getOption(for: indexPath)
        cell.title.text = option.title
        cell.backgroundImage.image = option.backgroundImage
        
        return cell
    }
}

