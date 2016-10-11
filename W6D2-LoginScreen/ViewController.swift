//
//  ViewController.swift
//  W6D2-LoginScreen
//
//  Created by Admin on 2016-10-11.
//  Copyright © 2016 ToyBox Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var dogs = [
        UIImage(named: "dog1")!,
        UIImage(named: "dog2")!,
        UIImage(named: "dog3")!,
        UIImage(named: "dog4")!,
    ]

    func flipImage() {
        
        UIView.transition(with: self.imageView , duration: 0.25, options: [.transitionFlipFromLeft], animations: { [weak self] in
            
            self?.imageView.image = self?.nextDogImage()

        })
        
    }
    
    func nextDogImage() -> UIImage {
        
        let firstDog = dogs.removeFirst()
        dogs.append(firstDog)
        return firstDog
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.flipImage), userInfo: nil, repeats: true)
        
//        UIView.animate(withDuration: 2) { [weak self] in
//            
//            guard let centerX = self?.view.center.x else {
//                return
//            }
//            
//            self?.usernameTextField.center.x = centerX
//            
//        }
//        
//        
//        UIView.animate(withDuration: 2, delay: 1, options: [], animations: {
//            
//            [weak self] in
//            
//            guard let centerX = self?.view.center.x else {
//                return
//            }
//            
//            self?.passwordTextField.center.x = centerX
//            
//        })
        
        UIView.animate(withDuration: 2, animations: { [weak self] in
            
            guard let centerX = self?.view.center.x else {
                return
            }
            
            self?.usernameTextField.center.x = centerX

            
        
            }) { (success) in
                
                UIView.animate(withDuration: 2) { [weak self] in
                    
                    guard let centerX = self?.view.center.x else {
                        return
                    }
                    
                    self?.passwordTextField.center.x = centerX
                    
                }
                
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

