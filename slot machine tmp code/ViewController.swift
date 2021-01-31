//
//  ViewController.swift
//  slot machine tmp code
//
//  Created by legion-11 on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
    var relativityArray: [String]?
    var winnings = 0
    var playerBet = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        relativityArray = createRelativityArray()
    }

    func createRelativityArray() -> [String] {
        var arr = [String]()
        arr.append(contentsOf: repeatElement("Blank", count: 27))  // 41.5% probability
        arr.append(contentsOf: repeatElement("Grapes", count: 10)) // 15.4% probability
        arr.append(contentsOf: repeatElement("Banana", count: 9))  // 13.8% probability
        arr.append(contentsOf: repeatElement("Orange", count: 8))  // 12.3% probability
        arr.append(contentsOf: repeatElement("Cherry", count: 5))  //  7.7% probability
        arr.append(contentsOf: repeatElement("Bar", count: 3))     //  4.6% probability
        arr.append(contentsOf: repeatElement("Bell", count: 2))    //  3.1% probability
        arr.append(contentsOf: repeatElement("Seven", count: 1))   //  1.5% probability
        return arr
    }

    func spinReels() -> [String] {
        var betLine = [String]()
        for _ in 0...2 {
            betLine.append("\(relativityArray!.randomElement()!)")
        }
        return betLine
    }
    
    func determineWinnings(_ spinResult: [String]) {
        let blanks = spinResult.filter{$0 == "Blank"}.count
        let grapes = spinResult.filter{$0 == "Grapes"}.count
        let bananas = spinResult.filter{$0 == "Banana"}.count
        let oranges = spinResult.filter{$0 == "Orange"}.count
        let cherries = spinResult.filter{$0 == "Cherry"}.count
        let bars = spinResult.filter{$0 == "Bar"}.count
        let bells = spinResult.filter{$0 == "Bell"}.count
        let sevens = spinResult.filter{$0 == "Seven"}.count
        if (blanks == 0) {
            if (grapes == 3) {
                winnings = playerBet * 10
            } else if (bananas == 3) {
                winnings = playerBet * 20
            } else if (oranges == 3) {
                winnings = playerBet * 30
            } else if (cherries == 3) {
                winnings = playerBet * 40;
            } else if (bars == 3) {
                winnings = playerBet * 50
            } else if (bells == 3) {
                winnings = playerBet * 75
            } else if (sevens == 3) {
                winnings = playerBet * 100
            } else if (grapes == 2) {
                winnings = playerBet * 2
            } else if (bananas == 2) {
                winnings = playerBet * 2;
            } else if (oranges == 2) {
                winnings = playerBet * 3
            } else if (cherries == 2) {
                winnings = playerBet * 4
            } else if (bars == 2) {
                winnings = playerBet * 5
            } else if (bells == 2) {
                winnings = playerBet * 10
            } else if (sevens == 2) {
                winnings = playerBet * 20
            } else if (sevens == 1) {
                winnings = playerBet * 5
            } else {
                winnings = playerBet
            }
            print("win")
        } else {
            winnings = 0
            print("loss")
        }
    }
    
    @IBAction func spin(_ sender: Any) {
        let tmp = spinReels()
        print(tmp)
        determineWinnings(tmp)
        print(winnings)
    }
}

