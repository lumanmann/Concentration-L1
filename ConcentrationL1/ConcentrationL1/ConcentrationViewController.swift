//
//  ConcentrationViewController.swift
//  ConcentrationL1
//
//  Created by WY NG on 22/7/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    // property ＝ instance variable
    // 當你宣告一物件(Object)變數為某一資料型態的類別,這物件便可以說是此類別的一個實例(Instance),此時的資料成員可以稱為實例變數(Instance variable)
    // Swift 要求實例變數的所有屬性都要初始化
    // 翻牌次數
    var flipCount: Int = 0 {
        // observer: 監視屬性的除初始化之外的屬性值變化
        // 在屬性值改變後觸發didSet
        didSet {
            //每當flipCount的值改變 更新flipCountLabel的字
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    // 卡片的emoji內容
    var emojiChoices = ["👻", "💩", "👻", "💩"]
    // 卡片集合
    @IBOutlet var cardButtons: [UIButton]!
    // 顯示翻過了多少張牌的標籤
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // 按到卡片時會執行
    @IBAction func touchCard(_ sender: UIButton) {
        // 每次按到卡片 flipCount 都會加一
        flipCount += 1
        // 確定cardButtons的index不是空（都有連到）後轉換卡片的樣式，不然print提示
        // array.index = array裡的位置
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("ATTENTION：：：：tounched card isnt in cardButtons")
        }
    }
   
    // 控制卡片的顯示樣式
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        // 判斷按鈕是否已經顯示了emoji
        // 如果有就翻過去，不顯示字，背景色設為橙色
        if button.currentTitle == emoji {
            button.setTitle("", for:  .normal)
            button.backgroundColor = UIColor.orange
        } else {
            //如果沒有emoji的話，那就把emoji顯示在白色背景上
            button.setTitle("\(emoji)", for: .normal)
            button.backgroundColor = UIColor.white
        }
    }

}




