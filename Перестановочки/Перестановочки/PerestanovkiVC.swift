//
//  PerestanovkiVC.swift
//  Перестановочки
//
//  Created by Rafael Shamsutdinov on 14.09.2022.
//

import UIKit


class PerestanovkiVC: UIViewController {
    
    @IBOutlet weak var n: UITextField!
    @IBOutlet weak var n1: UITextField!
    @IBOutlet weak var onOff: UISegmentedControl!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var n1text: UILabel!
    var flag: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        onOff.addTarget(self, action: #selector(PerestanovkiVC.indexChanged(_:)), for: .valueChanged)
        answer.isHidden = true

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if flag{
            answer.isHidden = false
            let powed = pow(Decimal(Int(n.text!)!), Int(n1.text!)!)
            answer.text = NSDecimalNumber(decimal: powed).stringValue
        }
        else {
            answer.isHidden = false
            answer.text = String(Int(factorial(Int(n.text!)!)))

        }
    }
    func factorial(_ n: Int) -> Double {
      return (1...n).map(Double.init).reduce(1.0, *)
    }
    @objc func indexChanged(_ sender: UISegmentedControl) {
        if onOff.selectedSegmentIndex == 0 {
            flag = true
            n1.isHidden = false
            n1text.isHidden = false
        } else if onOff.selectedSegmentIndex == 1 {
            flag = false
            n1.isHidden = true
            n1text.isHidden = true
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        n1.resignFirstResponder()
        n.resignFirstResponder()
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
