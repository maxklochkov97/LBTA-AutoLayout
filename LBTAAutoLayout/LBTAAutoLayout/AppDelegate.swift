//
//  AppDelegate.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 07.04.2022.
//

import UIKit

 @main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Как мы создаем билд нашего приложения в коде

        window = UIWindow()
        window?.makeKeyAndVisible()

        let layout = UICollectionViewFlowLayout()
        // Позволит редактировать направление свайпа
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)

        window?.rootViewController = swipingController

        return true
    }
}

