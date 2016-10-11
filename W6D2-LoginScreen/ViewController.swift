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
    
    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    
    
    var dogs = [
        UIImage(named: "dog1")!,
        UIImage(named: "dog2")!,
        UIImage(named: "dog3")!,
        UIImage(named: "dog4")!
    ]
    
    func retriveFirstDog() -> UIImage {
        
        let dog = dogs.removeFirst()
        dogs.append(dog)
        return dog
        
    }
    
    
    func nextDog() {
        UIView.transition(with: self.imageView, duration: 2, options: [.transitionFlipFromRight], animations: { [weak self] in
            self?.imageView.image = self?.retriveFirstDog()
        })
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        view.layoutIfNeeded()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.nextDog), userInfo: nil, repeats: true)
        
        
        
        UIView.animate(withDuration: 2, delay: 1, options: [], animations: { [weak self] in
            
            guard let centerX = self?.view.center.x else { return }
            
            self?.passwordTextField.center.x = centerX
            
            })
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.centerXConstraint.constant = 0
        
        UIView.animate(withDuration: 2) {
            
            self.view.layoutIfNeeded()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
