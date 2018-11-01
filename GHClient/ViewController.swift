//
//  ViewController.swift
//  ghclient-ios
//
//  Created by Xin Guo  on 2018/10/28.
//  Copyright © 2018 com.thoughtworks.workshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let date = Date()
            let dateformat = DateFormatter()
            let timeformat = DateFormatter()
            dateformat.dateFormat = "EEEE, MMMM dd"
            timeformat.dateFormat = "HH:mm:ss"
            let dateString = dateformat.string(from: date)
            let timeString = timeformat.string(from: date)
            self.timeLabel.text = timeString
            self.dayLabel.text = dateString + "th"
        }
        // Do any additional setup after loading the view, typically from a nib.
      }

}

