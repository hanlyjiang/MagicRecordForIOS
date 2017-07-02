//
//  ViewController.swift
//  FunnyApp04
//
//  Created by 蒋航 on 2017/7/2.
//  Copyright © 2017年 蒋航. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startRecord(_ sender: Any) {
        recordingLabel.text = "正在录音..."
    }
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "点击录音按钮开始录音"
    }
}

