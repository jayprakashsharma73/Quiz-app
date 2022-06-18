//
//  SecondViewController.swift
//  Quiz App
//
//  Created by Jay Prakash Sharma on 30/05/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Play button - navigating to second screen
    @IBAction func play(_ sender: UIButton) {
        if let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController{
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
}





