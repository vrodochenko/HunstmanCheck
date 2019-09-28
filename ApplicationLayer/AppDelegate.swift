//
//  AppDelegate.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 2019-09-28.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootViewController = MainViewConfigurator().build()

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()

        return true
    }
}
