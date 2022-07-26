//
//  ViewController.swift
//  lotteryGenerator
//
//  Created by rjjq on 2022/7/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var number1Text: UILabel!
    @IBOutlet weak var number2Text: UILabel!
    @IBOutlet weak var number3Text: UILabel!
    @IBOutlet weak var number4Text: UILabel!
    @IBOutlet weak var number5Text: UILabel!
    @IBOutlet weak var number6Text: UILabel!
    
    @IBOutlet weak var logText: UITextView!
    var randomCount: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generate(_ sender: Any) {
        // 產生不重覆的六個號碼
        var numbers: [Int] = []
        while numbers.count < 6 {
            let randNum = Int.random(in: 1...49)
            if !numbers.contains(randNum) {
                numbers.insert(randNum, at: 0)
            }
        }
        
        // 填數字
        let texts = [number1Text, number2Text, number3Text, number4Text, number5Text, number6Text]
        let sortedNumbers = numbers.sorted(by: <).enumerated()
        for (index, number) in sortedNumbers {
            // debugPrint(number, index)
            texts[index]?.text = String(number)
        }
        
        // 紀錄
        logText.text += "第 \(randomCount) 次 : "
        for (index, number) in sortedNumbers {
            if index == 5 {
                logText.text += "\(number)"
            } else {
                logText.text += "\(number), "
            }
            
        }
        logText.text += "\n"
        randomCount += 1
    }
    
}

