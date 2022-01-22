//
//  TabBarCoordinator.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class TabBarCoordinator:Coordinator{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let tabBarController = TabBarViewController()
        tabBarController.coordinator = self
        
        tabBarController.modalPresentationStyle = .fullScreen
        
        navigationController.present(tabBarController, animated: true, completion: nil)
        

        //MARK: Swipe
        let swipeNavigationController = UINavigationController()
        swipeNavigationController.tabBarItem = UITabBarItem(title: "swipe", image: nil, tag: 0)
//        swipeNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        //MARK: Pinch
        let pinchNavigationController = UINavigationController()
        pinchNavigationController.tabBarItem = UITabBarItem(title: "Pinch", image: nil, tag: 1)
//        pinchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        
        //MARK: Pan
        let panNavigationController = UINavigationController()
//        panNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        panNavigationController.tabBarItem = UITabBarItem(title: "Pan", image: nil, tag: 2)
        
        tabBarController.viewControllers = [
            swipeNavigationController,
            pinchNavigationController,
            panNavigationController,
        ]
        let swipeCoordinator = SwipeCoordinator(navigationController: swipeNavigationController)
        let pinchCoordinator = PinchCoordinator(navigationController: pinchNavigationController)
        let panCoordinator = PanCoordinator(navigationController: panNavigationController)

        coordinate(to: swipeCoordinator)
        coordinate(to: pinchCoordinator)
        coordinate(to: panCoordinator)
    }
}
