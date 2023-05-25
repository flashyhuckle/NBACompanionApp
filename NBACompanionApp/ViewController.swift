//
//  ViewController.swift
//  NBACompanionApp
//
//  Created by Marcin Głodzik on 23/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.performRequest()
    }


}

