//
//  PreviewViewController.swift
//  RecorderAppUIKitDemo
//
//  Created by Tanveer Prottoy on 25/2/20.
//  Copyright © 2020 Tanveer Prottoy. All rights reserved.
//

import UIKit
import AVFoundation

class PreviewViewController: UIViewController {
    var recordedAudioUrl: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    enum ButtonType: Int {
        case slow = 0, fast, high, low, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playAudioForButton(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag) {
            case .slow:
                playSound(rate: 1.5)
            case .fast:
                playSound(rate: 1.5)
            case .high:
                playSound(rate: 1000)
            case .low:
                playSound(rate: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            default:
                playSound(rate: 1.0)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopAudioPlay(_ sender: UIButton) {
        stopAudio()
        configureUI(.notPlaying)
    }
}
