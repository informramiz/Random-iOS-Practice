//
//  MyUserDefaults.swift
//  RandomPractice
//
//  Created by Ramiz Raja on 27/08/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import Foundation

class MyUserDefaults {
    enum UserDefaultsKeys: String {
        case hasAppLaunchedBefore
        case isDarkThemeOn
    }
    
    static func doFirstLaunchSetupIfNeeded() {
        if !UserDefaults.standard.bool(forKey: UserDefaultsKeys.hasAppLaunchedBefore.rawValue) {
            //app has not been launched, setup default state
            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasAppLaunchedBefore.rawValue)
            UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isDarkThemeOn.rawValue)
        }
    }
}
