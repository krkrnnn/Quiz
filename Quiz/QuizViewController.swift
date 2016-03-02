//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer:Int = 0
    
    
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    //正解を表示するラベル
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var correctAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [AnyObject]()
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["一般的な猫の前足の指は何本？","4","5","6",2])
        tmpArray.append(["一般的な猫の後ろ足の指は何本？","4","5","6",3])
        tmpArray.append(["猫の舌の感触は？","ザラザラ","フニフニ","ヌメヌメ",1])
        tmpArray.append(["室内飼育の猫の平均寿命は？","約５歳","約１５歳","約２５歳",2])
        tmpArray.append(["三毛猫にオスが生まれる頻度は？","300頭に1匹","3000頭に1匹","30000頭に1匹",3])
        tmpArray.append(["一般的な猫の睡眠時間は？","約5時間","約10時間","約15時間",3])
        tmpArray.append(["猫の歯は全部で何本？","20","30","40",2])
        tmpArray.append(["猫の五感で一番優れているのはどこ？","聴覚","視覚","嗅覚",1])
        tmpArray.append(["猫の鳴き声を英語で表現すると？","ニー","ニャンニャン","ミャオ",3])
        tmpArray.append(["猫は男女どちらになつきやすい？","男性","女性","どちらでもない",2])
        tmpArray.append(["猫の種類は何種類？","約40種類","約50種類","約60種類",1])
        tmpArray.append(["猫は自分の身長の何倍ジャンプできる？","約5倍","約6倍","約7倍", 3])
        tmpArray.append(["猫の心拍数は1分間に何回くらい？","約100回","約130回","約160回", 2])
        tmpArray.append(["猫のヒゲは左右それぞれ何列ずつ？","4列","5列","6列", 1])
        tmpArray.append(["光の三原則、赤、青、緑のうち猫が認識できないのは？","赤","青","緑", 1])
                //------------------------ここから上にクイズを書く------------------------//
        
        // 問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            
            
            //正解数を増やす
            correctAnswer++
            
            
            answerLabel.backgroundColor = UIColor.redColor()
            answerLabel.text = "正解！"
            
            /*let alertController = UIAlertController(
                title: "正解！",
                message: "",
                preferredStyle: .Alert
            )
            alertController.addAction(UIAlertAction(
                title: "次の問題へ",
                style: .Default,
                handler: nil
                )
            )
            
            self.presentViewController(alertController, animated: true, completion: nil)*/
        }else  {
            
            answerLabel.backgroundColor = UIColor.blueColor()
            answerLabel.text = "不正解！"

            /*let alert = UIAlertController(
                title: "不正解",
                message: "",
                preferredStyle: .Alert
            )
            alert.addAction(UIAlertAction(
                title: "正解は",
                style: .Default,
                handler: nil
                )
            )*/
            

        }
        
        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


