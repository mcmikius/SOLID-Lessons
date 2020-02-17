//
//  ViewController.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

struct Country: Decodable {
    var id: String
    var time: String
    var name: String
    var image: String?
}

class ViewController: UIViewController {
    
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        dataFetcher()
    }
    
    func changeName() {
        guard let name = myLabel.text, name != "" else {
            showAlert()
            return
        }
        print("Your name: \(name)")
    }
    
    // MARK: - Data storage
    
    func saveNameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
     
    func getNameFromCache() -> String {
        return "some name"
    }
    
    // MARK: - Networking
    
    func dataFetcher() {
        request { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode([Country].self, from: data)
            print(response)
        }
    }
    
    func request(completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
            
        }
        task.resume()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "YOUR NAME CAN'T BE EMPTY.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func changeLabel(_ sender: UITextField) {
        myLabel.text = myTextField.text
    }
    @IBAction func svaeButtonTapped(_ sender: UIButton) {
        changeName()
    }
    

}

