//
//  PlaySoundsViewController.swift
//  FunnyApp04
//  录音播放UI控制器
//  Created by 蒋航 on 2017/7/2.
//  Copyright © 2017年 蒋航. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController{
    
    @IBOutlet weak var slowButton:UIButton!
    @IBOutlet weak var fastButton:UIButton!
    @IBOutlet weak var highButton:UIButton!
    @IBOutlet weak var lowButton:UIButton!
    @IBOutlet weak var echoButton:UIButton!
    @IBOutlet weak var reverbButton:UIButton!
    @IBOutlet weak var stopButton:UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }


    var recordedAudoiUrl: URL!
    
    override func viewDidLoad() {
        configureUI(.notPlaying)
        print("PlaySoundUiController view did load And recordedAudoiUrl is :")
        print(recordedAudoiUrl)
        
    }
    
    
    @IBAction func playSound(_ sender: Any) {
        print("play sound cliked")
    }
    
    @IBAction func stopPlaySound(_ sender: Any){
        print("stop play sound clicked")
    }
}
