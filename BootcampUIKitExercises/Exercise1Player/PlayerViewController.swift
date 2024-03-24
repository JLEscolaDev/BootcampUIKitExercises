//
//  ViewController.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 8/3/24.
//

import UIKit

class PlayerViewController: UIViewController {
    let playerInteractor: PlayerLogic = PlayerLogic.shared
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.progressView.setProgress(0, animated: false)
    }
    
    @IBAction func previous(_ sender: Any) {
        if let indexPath = playerInteractor.getPreviousOptionIndex() {
            tableView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if let indexPath = playerInteractor.getNextOptionIndex() {
            tableView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    
    @IBAction func openApp(_ sender: Any) {
        self.progressView.setProgress(1, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.performSegue(withIdentifier: self.playerInteractor.getSelectedOptionSegue(), sender: nil)
        }
        
    }

}

