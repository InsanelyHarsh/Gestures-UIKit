//
//  IntroViewController.swift
//  Gesture Recognizer
//
//  Created by Harsh Yadav on 21/01/22.
//

import UIKit

protocol IntroViewControllerDelegate{
    func enterButtonIsPressed()
}

class IntroViewController: UIViewController {
//    let introView = IntroView()
    
    let msg:UILabel = {
        let msg = UILabel()
        msg.translatesAutoresizingMaskIntoConstraints = false
        msg.numberOfLines = 0
        msg.textColor = .white
        msg.text = "Welcome, First App made with UIKit."
        msg.font = msg.font.withSize(20)
        msg.font = UIFont.boldSystemFont(ofSize: 15)
        return msg
    }()
    
    let detail:UILabel = {
        let detail = UILabel()
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.numberOfLines = 0
        detail.textColor = .white
        detail.text = "And Coordinator Pattern"
        detail.font = detail.font.withSize(20)
        return detail
    }()
    
//    let enterButton:UIButton = {
//        let enterButton = UIButton()
//        enterButton.setTitle("Enter", for: .normal)
//        enterButton.setTitleColor(.white, for: .normal)
//        enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
//        return enterButton
//    }()
    
    let enterButton = UIButton()
    var introDelegate: IntroViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
//        introDelegate?.enterButtonIsPressed()
    }

    func setup(){
        view.backgroundColor = .purple
        title = "Hello UIKit"
//        view.translatesAutoresizingMaskIntoConstraints = false
        
        enterButton.setTitle("Enter", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterButton)
        enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
        
        msg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(msg)
        
        detail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detail)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            msg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            msg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            detail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detail.topAnchor.constraint(equalToSystemSpacingBelow: msg.bottomAnchor, multiplier: 2),
//            detail.centerYAnchor.constraint(equalToSystemSpacingBelow: view., multiplier: <#T##CGFloat#>)
            
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.topAnchor.constraint(equalToSystemSpacingBelow: detail.bottomAnchor, multiplier: 5),
        ])
//        NSLayoutConstraint.activate([
//
//
//            enterButton.widthAnchor
//                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
//            enterButton.heightAnchor
//                .constraint(equalToConstant: 50),
//            enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            enterButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//
//
//
//        ])
    }
    
    @objc func enterPressed(){
        introDelegate?.enterButtonIsPressed()
        print("Enter Button Is Pressed")
    }
}

//class IntroView:UIView{
//    let msg:UILabel = {
//        let msg = UILabel()
//        msg.translatesAutoresizingMaskIntoConstraints = false
//        msg.textColor = .white
//        msg.text = "welcome to my first app made with uikit."
//        return msg
//    }()
//}
