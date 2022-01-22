//
//  IntroCoordinator.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class IntroCoordinator:Coordinator{
    let navigationController:UINavigationController
    init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        print("Starting")
        let introViewController = IntroViewController()
        introViewController.introDelegate = self
        navigationController.pushViewController(introViewController, animated: true)
        
    }
}
extension IntroCoordinator:IntroViewControllerDelegate{
    func enterButtonIsPressed() {
        print("Working")
        
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
