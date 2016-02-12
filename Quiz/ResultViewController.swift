//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer:Int = 0
    
    //正解時に表示される本文
    var message: String = ""

    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //resultLabel.text = "\(correctAnswer)"
        
        if correctAnswer >= 6{
            message = "あなたは「火影レベル」です。すごい！"
        }else if correctAnswer >= 4{
            message = "あなたは「上忍レベル」です"
        }else if correctAnswer >= 3{
            message = "あなたは「中忍レベル」です"
        }else{
            message = "あなたは「下忍レベル」です"
        }
 
        resultLabel.text = "正解数は..." + "\(String(correctAnswer))" + "\(message)"
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
