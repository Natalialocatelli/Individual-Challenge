//
//  ViewController.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 15/10/22.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeRequest()
        
//        MARK: - Navigation Controller
        
        title = "Crie sua paleta"
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "BackgroundColor")]
        self.navigationController!.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "TextColor")]
        
        
//        MARK: - Count Title Label
        
        view.addSubview(titleLabel)
        titleLabel.text = "Quantas cores você quer?"
        titleLabel.textColor = UIColor(named: "TextColor")
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
//        MARK: - Count Text Field
        
        view.addSubview(textField)
        textField.textColor = UIColor(named: "TextColor")
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 67).isActive = true
        
//        MARK: - Hex Title Label
                
        view.addSubview(titleLabelHex)
        titleLabelHex.text = "Insira seu Hex"
        titleLabelHex.textColor = UIColor(named: "TextColor")
        titleLabelHex.topAnchor.constraint(equalTo: view.topAnchor, constant: 174).isActive = true
        titleLabelHex.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabelHex.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 37).isActive = true
        
//        MARK: - Hex Text Field
        view.addSubview(textFieldHex)
        textFieldHex.textColor = UIColor(named: "TextColor")
        textFieldHex.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 126).isActive = true
        textFieldHex.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        textFieldHex.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33).isActive = true
        textFieldHex.heightAnchor.constraint(equalToConstant: 67).isActive = true
        
//        MARK: - Result Title
        view.addSubview(titleLabelResult)
        titleLabelResult.text = "Resultado"
        titleLabelResult.textColor = UIColor(named: "TextColor")
        titleLabelResult.font = UIFont.systemFont(ofSize: 24)
        titleLabelResult.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabelResult.topAnchor.constraint(equalTo: view.topAnchor, constant: 174).isActive = true
        titleLabelResult.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabelResult.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 300).isActive = true

    }
    
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
    
    private let textField: UITextField = {
        let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let textFieldHex: UITextField = {
        let textHex = CustomTextField()
        textHex.translatesAutoresizingMaskIntoConstraints = false
        return textHex
    }()
    
    private func makeRequest() {
        let url = URL(string: "https://www.thecolorapi.com/scheme")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            
            guard let responseData = data else {return}
            
            if let responseString = String(data: responseData, encoding: .utf8)
            {
                print(responseString)
                
            }
            
        }
        task.resume()
    }
}

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        layer.shadowOpacity = 0.05
        layer.shadowRadius = 1.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 20, 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 20, 0)
    }
    
}
