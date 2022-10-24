//
//  FavoritesViewController.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 23/10/22.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables
    @IBOutlet weak var tableViewFavorites: UITableView!
    
    var colorAPIModel: ColorAPIModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFavorites.delegate = self
        tableViewFavorites.dataSource = self
        tableViewFavorites.register(HexCell.self, forCellReuseIdentifier: "cell")
        
        let data = FileManagerHelper.shared.read(fromDocumentsWithFileName: "a")
        
        do {
            let colorAPIModel = try JSONDecoder().decode(ColorAPIModel.self, from: Data(data.utf8))
            self.colorAPIModel = colorAPIModel
        } catch {
            print("nenhum")
        }
    }
    
    // MARK: Funcs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorAPIModel?.colors.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewFavorites.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HexCell else {
            return UITableViewCell()
            
        }
        
        guard let model = colorAPIModel?.colors[indexPath.row] else { return cell }
        
        cell.textLabel?.text = model.hex.value
        
        cell.setBackgroundColor(rgbModel: model.rgb)
        return cell
    }
    
}
