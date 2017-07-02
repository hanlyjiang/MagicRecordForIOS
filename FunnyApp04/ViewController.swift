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
    @IBOutlet weak var startRecordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setRecordable()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startRecord(_ sender: Any) {
        recordingLabel.text = "正在录音"
        startRecordButton.isEnabled = false
        stopRecordButton.isEnabled = true
    }
    @IBAction func stopRecording(_ sender: Any) {
        setRecordable()
        
    }
    
    func setRecordable() {
        recordingLabel.text = "点击录音按钮开始录音"
        startRecordButton.isEnabled = true
        stopRecordButton.isEnabled = false
    }
}

