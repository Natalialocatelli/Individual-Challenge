//
//  HexCell.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 19/10/22.
//

import UIKit

class HexCell: UITableViewCell {

    let background = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label: UILabel = UILabel()

        contentView.addSubview(label)
        label.text = "#98754"
        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let cell: UITableViewCell = UITableViewCell()
        
        cell.contentView.addSubview(label)
        
        
        contentView.addSubview(background)
        background.backgroundColor = .systemFill
        background.layer.cornerRadius = 15
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
        background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        background.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setBackgroundColor(rgbModel: RGB) {
        let r = rgbModel.fraction.r
        let g = rgbModel.fraction.g
        let b = rgbModel.fraction.b
        background.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)

    }
}

