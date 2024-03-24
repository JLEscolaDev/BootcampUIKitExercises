//
//  ScoreDetailTableViewController.swift
//  SwiftBootcampUIKit
//
//  Created by Jose Luis Escolá García on 7/3/24.
//

import UIKit

class HeroeDetailTableViewController: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var realName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var superPowers: UILabel!
    @IBOutlet weak var heroeDescription: UILabel!
    
    var selectedHeroe: Heroe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedHeroe else { return }
        if let imgName = selectedHeroe.imagen {
            imageView.image = UIImage(named: imgName)
        }
        nickname.text = selectedHeroe.apodo
        realName.text = selectedHeroe.nombreReal
        age.text = "\(selectedHeroe.edad) años"
        superPowers.text = selectedHeroe.poderes.joined(separator: ",")
        heroeDescription.text = selectedHeroe.descripcion
    }


    @IBAction func save(_ sender: Any) {
        print("guarda")
    }
}
