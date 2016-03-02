//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //正解数
    var correctAnswer:Int = 0
    
    //正解時に表示される本文
    var message: String = ""

    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //resultLabel.text = "\(correctAnswer)"
        
        if correctAnswer >= 14{
            message = "あなたは愛猫家ですね！すごい！"
        }else if correctAnswer >= 10{
            message = "あなたはなかなかの愛猫家です"
        }else if correctAnswer >= 7{
            message = "あなたはぼちぼちの愛猫家です"
        }else{
            message = "あなたはまだまだの愛猫家です"
        }
 
        resultLabel.numberOfLines = 2
        resultLabel.font = UIFont.systemFontOfSize(CGFloat(20))
        resultLabel.text = "正解数は..." + "\(String(correctAnswer))" + "問 / 15問中" + "\n" + "\(message)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
