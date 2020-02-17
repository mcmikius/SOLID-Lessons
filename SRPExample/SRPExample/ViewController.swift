//
//  ViewController.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    var networkDataFetcher = NetworkDataFetcher()
    let dataStore = DataStore()

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        networkDataFetcher.dataFetcher(urlString: urlString)
    }
    
    func changeName() {
        guard let name = myLabel.text, name != "" else {
            showAlert()
            return
        }
        dataStore.saveNameInCache(name: name)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "YOUR NAME CAN'T BE EMPTY.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeLabel(_ sender: Any) {
        myLabel.text = myTextField.text
    }
    
    @IBAction func svaeButtonTapped(_ sender: UIButton) {
        changeName()
    }
    

}

