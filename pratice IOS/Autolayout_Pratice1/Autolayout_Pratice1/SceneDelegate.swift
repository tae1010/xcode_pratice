//
//  SceneDelegate.swift
//  Autolayout_Pratice1
//
//  Created by 김정태 on 2022/09/13.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    

    var window: UIWindow?
    var checkPopup = UserDefault().loadUserdefault()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        let popupStoryboard = UIStoryboard(name: "Main", bundle: nil)
        print("checkPopup 상태", checkPopup)
        if checkPopup {
            guard let popupViewController = popupStoryboard.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
            
            popupViewController.modalPresentationStyle = .overFullScreen
            popupViewController.modalTransitionStyle = .crossDissolve
            
            self.window?.makeKeyAndVisible()

            self.window?.rootViewController?.present(popupViewController, animated: true)
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
}
