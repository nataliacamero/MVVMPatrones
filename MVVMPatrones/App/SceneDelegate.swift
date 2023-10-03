//
//  SceneDelegate.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
                let window = UIWindow(windowScene: scene)

                let navigationController = UINavigationController()
                let splashViewController = SplashViewController()

                navigationController.setViewControllers([splashViewController], animated: true)

                window.rootViewController = navigationController
                window.makeKeyAndVisible()
                self.window = window
    }


 

}

