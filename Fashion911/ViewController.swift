//
//  ViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/15/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Timer.scheduledTimer(timeInterval: 5.1, target: self, selector: #selector(self.welcomePage), userInfo: nil, repeats: false)
        
    }
    
    func welcomePage() {
        
        let welcomeVC = self.storyboard!.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        
        self.present(welcomeVC, animated: true, completion: nil)
        
    }


}

