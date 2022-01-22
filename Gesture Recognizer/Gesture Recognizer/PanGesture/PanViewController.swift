//
//  PanViewController.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit
class PanViewController: UIViewController {

    let myView:UIView = {
        let myView = UIView()
        myView.backgroundColor = .red
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.isUserInteractionEnabled = true
        myView.frame = .zero
        return myView
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.frame = .zero
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        layout()
        setup()
        label.text = "Hello"
        // Do any additional setup after loading the view.
    }

    func setup(){
//        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(onswipe(_:)))
//        gesture.numberOfTouchesRequired = 1
//        gesture.direction = .right
//        myView.addGestureRecognizer(gesture)
//        print(gesture.location(in: view))
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        panGesture.minimumNumberOfTouches = 1
        myView.addGestureRecognizer(panGesture)
    }
    
//    @objc func onswipe(_ gesture:UISwipeGestureRecognizer){
//        if let v = gesture.view{
//            v.backgroundColor = .black
//        }
//    }
        

    @objc func onPan(_ panGesture:UIPanGestureRecognizer){
        if let V = panGesture.view{
            if panGesture.state == .began || panGesture.state == .changed{
                let translation = panGesture.translation(in: V)
                let xAxis = UIScreen.main.bounds.width - 100
                let yAxis = UIScreen.main.bounds.height - 100
                /*
                 X = width/2 ,UIScreen.main.bounds.width - width/2
                 */
                let changeX = V.center.x + translation.x
                let changeY = V.center.y + translation.y
                if (changeX > 100) && (changeY > 100) && (changeX < xAxis) && (changeY < yAxis){
                    V.center = CGPoint(x: changeX, y: changeY)
                    panGesture.setTranslation(CGPoint.zero, in: V)
                }
//                if 100 < changeX < (UIScreen.main.bounds.width - 100){
//
//                }
                
//                label.text = "(\(translation.x),\(translation.y))"

            }
        }
    }
    func layout(){
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myView)

        view.addSubview(label)
        NSLayoutConstraint.activate([
            myView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            myView.widthAnchor.constraint(equalToConstant: 200),
            myView.heightAnchor.constraint(equalToConstant: 200),
            
            label.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

}
