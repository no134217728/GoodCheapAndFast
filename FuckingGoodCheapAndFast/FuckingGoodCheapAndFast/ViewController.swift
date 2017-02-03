//
//  ViewController.swift
//  FuckingGoodCheapAndFast
//
//  Created by WeiJenWang on 2017/2/2.
//  Copyright © 2017年 Apacer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swhGood: UISwitch!
    @IBOutlet weak var swhCheap: UISwitch!
    @IBOutlet weak var swhFast: UISwitch!
    
    var totalScore: UInt32 = 0
    var selectedItem: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swhChange(_ sender: UISwitch) {
        switch sender {
        case swhGood:
            selectedItem = 1
            if swhGood.isOn {
                totalScore += 1
            } else {
                totalScore -= 1
            }
        case swhCheap:
            selectedItem = 2
            if swhCheap.isOn {
                totalScore += 1
            } else {
                totalScore -= 1
            }
        case swhFast:
            selectedItem = 3
            if swhFast.isOn {
                totalScore += 1
            } else {
                totalScore -= 1
            }
        default:
            break
        }
        
        checkScore()
    }
    
    func checkScore() -> Void {
        if totalScore >= 3 {
            let rndNum:UInt32 = arc4random_uniform(3) + 1
            if rndNum == selectedItem {
                checkScore()
            } else {
                switch rndNum {
                case 1:
                    swhGood.setOn(false, animated: true)
                case 2:
                    swhCheap.setOn(false, animated: true)
                case 3:
                    swhFast.setOn(false, animated: true)
                default:
                    checkScore()
                }
                totalScore -= 1
            }
        }
    }
}

