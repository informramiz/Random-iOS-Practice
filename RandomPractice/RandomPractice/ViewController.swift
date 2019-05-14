//
//  ViewController.swift
//  RandomPractice
//
//  Created by Apple on 13/05/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "StartOver", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc private func startOver() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

