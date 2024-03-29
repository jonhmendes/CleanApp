//
//  SceneDelegate.swift
//  Main
//
//  Created by Jonathan Carvalho Mendes on 12/08/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SignUpFactory.makeController()
        window?.makeKeyAndVisible()
    }

}

