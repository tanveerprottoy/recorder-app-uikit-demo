//
//  AudioUtils.swift
//  RecorderAppUIKitDemo
//
//  Created by Tanveer Prottoy on 25/2/20.
//  Copyright © 2020 Tanveer Prottoy. All rights reserved.
//

import AVFoundation

class AudioUtils {
    var audioRecorder: AVAudioRecorder!
    
    func startRecord(delegate: AVAudioRecorderDelegate) {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(
            AVAudioSession.Category.playAndRecord,
            mode: AVAudioSession.Mode.default,
            options: AVAudioSession.CategoryOptions.defaultToSpeaker
        )
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])  // [:] = empty dictionary
        audioRecorder.delegate = delegate
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func stopRecord() {
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false)
    }
    
    func getFileUrl() -> URL {
        return audioRecorder.url
    }
}
