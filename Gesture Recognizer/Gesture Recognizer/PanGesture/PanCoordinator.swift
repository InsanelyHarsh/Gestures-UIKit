//
//  PanCoordinator.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class PanCoordinator:Coordinator{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let pan = PanViewController()
        navigationController.pushViewController(pan, animated: false)
        
//        pan.modalPresentationStyle = .fullScreen
//        navigationController.present(pan, animated: true, completion: nil)
    }
}
