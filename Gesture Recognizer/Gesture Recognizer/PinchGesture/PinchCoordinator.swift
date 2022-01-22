//
//  PinchCoordinator.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class PinchCoordinator:Coordinator{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let pinch = PinchViewController()
//        navigationController.present(pinch, animated: true, completion: nil)
        navigationController.pushViewController(pinch, animated: false)
//        pinch.modalPresentationStyle = .fullScreen
    }
}
