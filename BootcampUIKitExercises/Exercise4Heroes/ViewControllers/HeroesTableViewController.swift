//
//  HeroesTableViewController.swift
//  SwiftBootcampUIKit
//
//  Created by Jose Luis Escolá García on 7/3/24.
//

import UIKit

final class HeroesTableViewController: UITableViewController {

    let logic = HeroeLogic.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        logic.heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = UIListContentConfiguration.subtitleCell()
        cell.contentConfiguration = content
        let heroe = logic.getHeroe(indexPath: indexPath)
        content.text = heroe.apodo
        content.secondaryText = heroe.nombreReal
        if let imagen = heroe.imagen {
            content.image = UIImage(named: imagen)
            content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
            content.imageProperties.cornerRadius = 20
        }
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            logic.removeHeroe(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        logic.moveHeroe(from: fromIndexPath, to: to)
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let selected = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? HeroeDetailTableViewController else { return }
        let heroe = logic.getHeroe(indexPath: selected)
        destination.selectedHeroe = heroe
        
        // INTERESANTE: Aunque tenemos acceso directo a las variables del otro tableViewController, no podemos setear los valores directamente sin la función selectedScore porque para cuando el prepare for segue (esta función) intenta setear el valor, los outlets aún no han sido creados y por lo tanto, explota al intentar establecer un valor en un elemento que aún no existe.
    }
    

}
