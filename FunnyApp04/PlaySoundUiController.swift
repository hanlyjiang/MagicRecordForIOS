//
//  PlaySoundUiController.swift
//  FunnyApp04
//  录音播放UI控制器
//  Created by 蒋航 on 2017/7/2.
//  Copyright © 2017年 蒋航. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundUiController: UIViewController ,AVAudioPlayerDelegate{

    var recordedAudoiUrl: URL!
    
    override func viewDidLoad() {
        //
        print("PlaySoundUiController view did load And recordedAudoiUrl is :")
        print(recordedAudoiUrl)
    }
    
    @IBAction func startPlay(_ sender: Any) {
        
    }
}