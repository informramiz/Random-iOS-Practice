//
//  UserDefaultsTestViewController.swift
//  RandomPractice
//
//  Created by Ramiz Raja on 27/08/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import UIKit

class UserDefaultsTestViewController: UIViewController {
    @IBOutlet weak var themeSwitchView: UISwitch!
    
    private func updateTheme() {
        if MyUserDefaults.isDarkThemeOn() {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeSwitchView.isOn = MyUserDefaults.isDarkThemeOn()
        updateTheme()
    }
    
    @IBAction func onThemeChange(_ sender: Any) {
        UserDefaults.standard.set(themeSwitchView.isOn, forKey: MyUserDefaults.UserDefaultsKeys.isDarkThemeOn.rawValue)
        updateTheme()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
