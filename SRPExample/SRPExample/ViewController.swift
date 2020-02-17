//
//  ViewController.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var dataFetcherService = DataFetcherService()
    let dataStore = DataStore()

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        dataFetcherService.fetchCountry { (countries) in
            print(countries?.first?.Name as Any)
        }
        dataFetcherService.fetchFreeGames { (freeGames) in
            print(freeGames?.feed.results.first?.name as Any)
        }
        dataFetcherService.fetchNewGames { (newGames) in
            print(newGames?.feed.results.first?.name as Any)
        }
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

