//
//  AppCoordinator.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit

protocol Coordinator{
    func start()
    func coordinate(to coordinator: Coordinator)
}
extension Coordinator{
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}


class AppCoordinator{
    let window:UIWindow
    
    init(window:UIWindow){
        self.window = window
    }
}
extension AppCoordinator:Coordinator{
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
//        navigationController.pushViewController(IntroViewController(), animated: true)
        
//        navigationController.pushViewController(IntroViewController(), animated: true)
//        navigationController.title = "Welcome :UIKit"
        
        let introCoordinator = IntroCoordinator(navigationController: navigationController)
//        introCoordinator.start()
        coordinate(to: introCoordinator)
//        window.makeKeyAndVisible()
    }
   
}
