//
//  WelcomeViewController.swift
//  Fashion911
//
//  Created by Adrian McDaniel on 3/27/17.
//  Copyright © 2017 Adrian McDaniel. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var getStartedButton: UIButton!
    
    @IBAction func getStartedTapped(_ sender: Any) {
        
        let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
        
        self.present(navigationVC, animated: true, completion: nil)
        
        return
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIImage(named: "fashionwelcome") != nil {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fashionwelcome")!)
        }
        
        getStartedButton.layer.borderColor = UIColor.lightGray.cgColor
        getStartedButton.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
