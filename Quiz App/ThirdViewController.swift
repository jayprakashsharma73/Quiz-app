//
//  ThirdViewController.swift
//  Quiz App
//
//  Created by Jay Prakash Sharma on 01/06/22.
//

import UIKit

class ThirdViewController: UIViewController {
    //variable
    var result:String = ""
    //Total Score label outlet
    @IBOutlet weak var totalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalScore.text = result
    }
    @IBAction func goToFirstScreen(_ sender: UIButton) {
        if let firstVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController{
            self.navigationController?.pushViewController(firstVC, animated: true)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
