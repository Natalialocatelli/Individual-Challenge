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
        makeRequest()
    }
    
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

