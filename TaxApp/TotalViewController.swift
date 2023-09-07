//
//  TotalViewController.swift
//  TaxApp
//
//  Created by 沼田英也 on 2023/09/04.
//

import UIKit

class TotalViewController: UIViewController {
    
    var numbers: [Double] = []

    @IBOutlet weak var additionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            numbers = userDefaults.object(forKey: "add") as! [Double]
            print(numbers)
            let sum = numbers.reduce(0, +)
            print("合計: \(sum)")
            additionLabel.text = "合計: \(sum)"
            
            // Do any additional setup after loading the view.
        }
    }
    

    @IBAction func shareButton(_ sender: UIButton) {
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
