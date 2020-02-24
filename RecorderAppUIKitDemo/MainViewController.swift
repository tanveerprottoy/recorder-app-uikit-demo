//
//  MainViewController.swift
//  RecorderAppUIKitDemo
//
//  Created by Tanveer Prottoy on 23/2/20.
//  Copyright © 2020 Tanveer Prottoy. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    private var audioUtils: AudioUtils!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
        stopButton?.isEnabled = false
        audioUtils = AudioUtils()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidDisappear called")
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
        if flag {
            performSegue(withIdentifier: "detailSegue", sender: audioUtils.getFileUrl())
        }
        else {
            print("Recording failed")
        }
    }
    
    @IBAction func onStartRecord(_ sender: UIButton) {
        statusLabel?.text = "Recording..."
        startButton.isEnabled = false
        stopButton.isEnabled = true
        audioUtils.startRecord(delegate: self)
    }
    
    @IBAction func onStopRecord(_ sender: UIButton) {
        statusLabel?.text = "Tap to start record..."
        stopButton.isEnabled = false
        startButton.isEnabled = true
        audioUtils.stopRecord()
    }
}
