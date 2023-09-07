//
//  ViewController.swift
//  TaxApp
//
//  Created by 沼田英也 on 2023/09/04.
//

import UIKit

class ViewController: UITableViewController {


    

    
    
    @IBOutlet weak var resultField: UILabel!
    
    @IBOutlet weak var caliculationField: UITextField!
    

    var numbers: [Double] = []
    var taxRate: Double = 1.1
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultIdentifier")
        
        print("1")
        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            numbers = userDefaults.object(forKey: "add") as! [Double]
            print(numbers.count)


        
        }

           
    }
    



    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // 表示作成
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)           // ボタン作成
        alert.addAction(alertAction)                                                          // 表示にボタンを追加
        present(alert, animated: true)
    }
    
    func textToInt() -> Int? {
        if let text = caliculationField.text, let intValue = Int(text) {
            // テキストが整数
            return intValue
        } else {
            showAlert(title: "エラー!", message: "数字を入力してください")
            return nil
        }
    }

    @IBAction func taxPercent(_ sender: UISegmentedControl) {
        if let intValue = textToInt() {
            switch (sender as AnyObject).selectedSegmentIndex {
            case 0:
                let result = Double(intValue) * 1.1
                resultField.text = String(result)
            case 1:
                let result = Double(intValue) * 1.08
                resultField.text = String(result)
            default:
                break
            }
        }
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        if let resultText = resultField.text, let resultValue = Double(resultText) {
            numbers.append(Double(resultValue))
            print(numbers)
            let userDefaults = UserDefaults.standard
                    userDefaults.set(numbers, forKey: "add")
            tableView.reloadData()

        }
    }
    @IBAction func inputField(_ sender: UITextField) {
        if let intValue = textToInt() {
            let result = Double(intValue) * taxRate
            resultField.text = String(format: "%.2f", result)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultIdentifier", for: indexPath)
        
        let number = numbers[indexPath.row]
        cell.textLabel?.text = "\(number)"

  
        
        return cell
    }
     
}

