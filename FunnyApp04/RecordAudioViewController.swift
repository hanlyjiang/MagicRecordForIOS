//
//  RecordAudioViewController.swift
//  FunnyApp04
//
//  Created by 蒋航 on 2017/7/2.
//  Copyright © 2017年 蒋航. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController,AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var startRecordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!

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
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    @IBAction func stopRecording(_ sender: Any) {
        setRecordable()
        let session = AVAudioSession.sharedInstance()
        audioRecorder.stop()
        try! session.setActive(false)
        
    }
    
    func setRecordable() {
        recordingLabel.text = "点击录音按钮开始录音"
        startRecordButton.isEnabled = true
        stopRecordButton.isEnabled = false
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            print("Audio Record did finished：\(audioRecorder.url)")
            // 启动另一个ViewController
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }else {
            print("录音失败")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }else{
            print("identifier not correct")
        }
        
        //
    }
    
}

