//
//  PinchViewController.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class PinchViewController:UIViewController{
    let rectangle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}
extension PinchViewController{
    private func setup(){
        view.backgroundColor = .systemGray3
//        view.translatesAutoresizingMaskIntoConstraints = false
        
        rectangle.backgroundColor = .red
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rectangle)
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(onPinch(_:)))
        rectangle.addGestureRecognizer(pinchGesture)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            rectangle.widthAnchor.constraint(equalToConstant: 200),
            rectangle.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc func onPinch(_ sender: UIPinchGestureRecognizer){
        var pinchScale = sender.scale
        pinchScale = round(pinchScale*1000)/1000

        sender.view?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        if sender.state == .changed{
            sender.view?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            sender.view?.backgroundColor = .white
        }
        if sender.state == .ended{
            sender.view?.backgroundColor = .green
            sender.view?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }
    }
}
