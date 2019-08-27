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
        testFileReadWrite()
    }
    
    @IBAction func onThemeChange(_ sender: Any) {
        UserDefaults.standard.set(themeSwitchView.isOn, forKey: MyUserDefaults.UserDefaultsKeys.isDarkThemeOn.rawValue)
        updateTheme()
    }
    
    private func testFileReadWrite() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last!.appendingPathComponent("myFile.txt")
        
        //let's write some text to file
        do {
            try "Hi There".write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print("Error occurred while writing text to file")
        }
        
        //let's read the text from file to make sure it was written correctly
        do {
            let content = try String(contentsOf: url, encoding: .utf8)
            if content == "Hi There" {
                print("File write and read was done correctly")
            } else {
                print("There was some issue in either writing the file or reading the file")
            }
        } catch {
            print("Error occurred while reading from file")
        }
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
