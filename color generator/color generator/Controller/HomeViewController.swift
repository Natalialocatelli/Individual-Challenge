//
//  HomeViewController.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 23/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBAction func generatePalette(_ sender: Any) {
        let generateViewController = GenerateViewController()
        self.navigationController?.pushViewController(generateViewController, animated: true)
    }
    @IBAction func buttonMyFavorites(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "Favorite") as! FavoritesViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    @IBOutlet weak var buttonGeneretaPalette: UIButton!
    @IBOutlet weak var buttonMyPalettes: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonGeneretaPalette.layer.cornerRadius = 15
        buttonMyPalettes.layer.cornerRadius = 15
        buttonMyPalettes.layer.borderWidth = 1
        buttonMyPalettes.layer.borderColor = UIColor(named: "BorderButtonColor")?.cgColor
    }
}
