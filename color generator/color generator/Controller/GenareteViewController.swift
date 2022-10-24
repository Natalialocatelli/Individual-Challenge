//
//  ViewController.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 15/10/22.
//

import UIKit


class GenerateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var colorAPIModel: ColorAPIModel?
    var stringModel: String?
    
    private let buttonSavePalette: UIButton = {
        let buttonSave = UIButton()
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        return buttonSave
    }()
    
    private let buttonGeneratePalette: UIButton = {
        let buttonGenerate = UIButton()
        buttonGenerate.translatesAutoresizingMaskIntoConstraints = false
        return buttonGenerate
    }()
    
    private let titleLabelResult: UILabel = {
        let labelResult = UILabel()
        labelResult.translatesAutoresizingMaskIntoConstraints = false
        return labelResult
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabelHex: UILabel = {
        let labelHex = UILabel()
        labelHex.translatesAutoresizingMaskIntoConstraints = false
        return labelHex
    }()
    
    private let textFieldColors: UITextField = {
        let text = CustomTextField()
        text.keyboardType = .numberPad
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let textFieldHex: UITextField = {
        let textHex = CustomTextField()
        textHex.translatesAutoresizingMaskIntoConstraints = false
        return textHex
    }()
    
    private lazy var tableViewColors: UITableView = {
        let tableColors = UITableView()
        tableColors.translatesAutoresizingMaskIntoConstraints = false
        
        tableColors.delegate = self
        tableColors.dataSource = self
        tableColors.separatorColor = UIColor.clear
        tableColors.register(HexCell.self, forCellReuseIdentifier: "cell")
        
        return tableColors
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        MARK: - Navigation Controller
        
        title = "Crie sua paleta"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.backgroundColor = .systemBackground
        buttonGeneratePalette.addTarget(self, action: #selector(loadPalette), for: .touchDown)
        buttonSavePalette.addTarget(self, action: #selector(save), for: .touchDown)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "BackgroundColor")]
        self.navigationController!.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "TextColor")]
    
        
//        MARK: - Count Title Label
        
        view.addSubview(titleLabel)
        titleLabel.text = "Quantas cores você quer?"
        titleLabel.textColor = UIColor(named: "TextColor")
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
//        MARK: - Count Text Field Number of Colors
        
        view.addSubview(textFieldColors)
        textFieldColors.textColor = UIColor(named: "TextColor")
        textFieldColors.placeholder = "Ex: Insira um número de 1 a 5"
        textFieldColors.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        textFieldColors.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        textFieldColors.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33).isActive = true
        textFieldColors.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
//        MARK: - Hex Title Label
                
        view.addSubview(titleLabelHex)
        titleLabelHex.text = "Insira seu Hex"
        titleLabelHex.textColor = UIColor(named: "TextColor")
        titleLabelHex.topAnchor.constraint(equalTo: view.topAnchor, constant: 174).isActive = true
        titleLabelHex.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabelHex.bottomAnchor.constraint(equalTo: textFieldColors.bottomAnchor, constant: 37).isActive = true
        
//        MARK: - Hex Text Field Hex
        view.addSubview(textFieldHex)
        textFieldHex.textColor = UIColor(named: "TextColor")
        textFieldHex.placeholder = "Ex: D2D2D2"
        textFieldHex.topAnchor.constraint(equalTo: titleLabelHex.bottomAnchor, constant: 14).isActive = true
        textFieldHex.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        textFieldHex.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33).isActive = true
        textFieldHex.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
//        MARK: - UIButton
                
        view.addSubview(buttonGeneratePalette)
        buttonGeneratePalette.backgroundColor = UIColor(named: "ButtonGeneratePalette")
        buttonGeneratePalette.heightAnchor.constraint(equalToConstant: 67).isActive = true
        buttonGeneratePalette.layer.cornerRadius = 15
        buttonGeneratePalette.setTitle("Generate", for: .normal)
        buttonGeneratePalette.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonGeneratePalette.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonGeneratePalette.setTitleColor(UIColor(named: "ButtonTextColorGenerate"), for: .normal)
        buttonGeneratePalette.layer.borderWidth = 2
        buttonGeneratePalette.layer.borderColor = UIColor(named: "BorderButtonColor")?.cgColor
        buttonGeneratePalette.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        buttonGeneratePalette.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33).isActive = true
        buttonGeneratePalette.topAnchor.constraint(equalTo: textFieldHex.bottomAnchor, constant: 28).isActive = true
        buttonGeneratePalette.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
//        MARK: - Result Title
        view.addSubview(titleLabelResult)
        titleLabelResult.text = "Resultado"
        titleLabelResult.textColor = UIColor(named: "TextColor")
        titleLabelResult.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabelResult.topAnchor.constraint(equalTo: buttonGeneratePalette.bottomAnchor, constant: 26).isActive = true
        titleLabelResult.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        
//        MARK: - TableView
        view.addSubview(tableViewColors)
        tableViewColors.topAnchor.constraint(equalTo: titleLabelResult.bottomAnchor, constant: 10).isActive = true
        tableViewColors.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34).isActive = true
        tableViewColors.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -34).isActive = true
        tableViewColors.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true

//        MARK: - Button Save
        view.addSubview(buttonSavePalette)
        
        buttonSavePalette.backgroundColor = UIColor(named: "ButtonGeneratePalette")
        buttonSavePalette.heightAnchor.constraint(equalToConstant: 67).isActive = true
        buttonSavePalette.layer.cornerRadius = 15
        buttonSavePalette.setTitle("Save Palette", for: .normal)
        buttonSavePalette.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonSavePalette.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonSavePalette.setTitleColor(UIColor(named: "ButtonTextColorGenerate"), for: .normal)
        buttonSavePalette.layer.borderWidth = 2
        buttonSavePalette.layer.borderColor = UIColor(named: "BorderButtonColor")?.cgColor
        buttonSavePalette.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        buttonSavePalette.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33).isActive = true
        buttonSavePalette.topAnchor.constraint(equalTo: tableViewColors.bottomAnchor, constant: 20).isActive = true
        buttonSavePalette.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    @objc func loadPalette() {
        guard let number = Int(textFieldColors.text!) else { return }
        let hex = textFieldHex.text!.replacingOccurrences(of: " ", with: "")
        makeRequest(number: number, hex: hex) { model, stringModel in
            
            self.colorAPIModel = model
            self.stringModel = stringModel
            
            DispatchQueue.main.async {
                self.tableViewColors.reloadData()
            }
        }
        
    }
    
    @objc func save() {
        FileManagerHelper.shared.save(text: stringModel ?? "", withFileName: "a")
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(colorAPIModel?.colors.count)
        return colorAPIModel?.colors.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewColors.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HexCell else {
            return UITableViewCell()
            
        }
        
        
        guard let model = colorAPIModel?.colors[indexPath.row] else { return cell }
        
        cell.textLabel?.text = model.hex.value
        
        cell.setBackgroundColor(rgbModel: model.rgb)
        return cell
    }
    
    private func makeRequest(number: Int, hex: String, completion: @escaping (_ model: ColorAPIModel, _ stringModel: String) -> ()) {
        let url = URL(string: "https://www.thecolorapi.com/scheme?hex=\(hex)&count=\(number)")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
//            print("response: \(String(describing: response))")
//            print("error: \(String(describing: error))")
            
            guard let responseData = data else {
                // chamar a completion e avisar pro usuario que teve um erro na requisicao via alert
                return
            }
            do {
                let colorAPIModel = try JSONDecoder().decode(ColorAPIModel.self, from: responseData)
//                print("objects posts: \(colorAPIModel)")
                let stringModel = String(decoding: data!, as: UTF8.self)
                completion(colorAPIModel, stringModel)
            } catch let error {
//                print("oioioi: \(error)")
                // chamar a completion e avisar pro usuario que teve um erro na requisicao via alert
            }
        }
        task.resume()
    }
}



