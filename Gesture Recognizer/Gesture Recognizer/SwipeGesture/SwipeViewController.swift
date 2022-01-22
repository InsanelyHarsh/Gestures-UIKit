//
//  SwipeViewController.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

//import Foundation
import UIKit
class SwipeViewController:UIViewController{
//    let rectangle = UIView()
    let rectangle = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}
extension SwipeViewController{
    private func setup(){
        view.backgroundColor = .systemGray3
//        view.translatesAutoresizingMaskIntoConstraints = false
        
        rectangle.backgroundColor = .red
        rectangle.translatesAutoresizingMaskIntoConstraints = false
//        rectangle.center = self.view.center
        view.addSubview(rectangle)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        swipeGesture.direction = .right
        swipeGesture.numberOfTouchesRequired = 1
        
        rectangle.isUserInteractionEnabled = true
//        rectangle.isMultipleTouchEnabled = true
        
        rectangle.addGestureRecognizer(swipeGesture)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            rectangle.widthAnchor.constraint(equalToConstant: 200),
            rectangle.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc func onSwipe(_ sender:UISwipeGestureRecognizer){
        if let myView = sender.view{
            myView.backgroundColor = .green
        }
    }
    

}
