//
//  FirstViewController.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 19/10/22.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addPaletteButton)
    }
   
    private let addPaletteButton: UIButton = {
        let paletteButton = UIButton()
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        paletteButton.setImage(image, for: .normal)
        paletteButton.translatesAutoresizingMaskIntoConstraints = false
        paletteButton.tintColor = .systemBackground
        
        return paletteButton
        
    }()

    func openNextView() {
        let viewController = ViewController()
        present(viewController, animated: true, completion: nil)
    }
}
