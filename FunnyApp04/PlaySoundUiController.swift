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

    

    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundUiController view did load And recordedAudoiUrl is : \(recordedAudioURL)")
        setupAudio()
    }
    
    
    @IBAction func playSound(_ sender: UIButton) {
        print("play sound cliked")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)

    }
    
    @IBAction func stopPlaySound(_ sender: Any){
        print("stop play sound clicked")
        stopAudio()
    }
}
