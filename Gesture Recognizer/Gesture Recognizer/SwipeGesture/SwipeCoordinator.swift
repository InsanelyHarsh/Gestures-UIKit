//
//  SwipeCoordinator.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class SwipeCoordinator:Coordinator{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let swipe = SwipeViewController()
        navigationController.pushViewController(swipe, animated: false)
        
//        navigationController.present(swipe, animated: true, completion: nil)
//        swipe.modalPresentationStyle = .fullScreen

    }
}
