//
//  ViewController.swift
//  DatePicker
//
//  Created by Jason Deng on 2020/11/17.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer?
    @IBOutlet weak var theEndDate: UILabel!
    
    @IBOutlet weak var nowUILabel: UILabel!
    
    @IBOutlet weak var richDateLabel: UILabel!
    @IBOutlet weak var timeUIDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeUIDatePicker.minimumDate = Date().addingTimeInterval(60 * 60 * 24)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
            self.nowUILabel.text = self.getCurrentDate(date: Date())
        }
             
    }

    @IBAction func pickDate(_ sender: UIDatePicker) {
        richDateLabel.text = getCurrentDate(date: sender.date)
        // 取得財富自由日 - now 的時間差（秒數）
        if let timer = timer {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in
            let interval =
             Int(sender.date.timeIntervalSinceNow)
            let sec = interval % 60
            let min = interval / 60 % 60
            let hour = interval/60/60 % 60
            let day = interval/60/60/24
            self.theEndDate.text = "\(day) 天\(hour) 時\(min) 分\(sec) 秒"
        }
       
    }
    
    func getCurrentDate(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
}

