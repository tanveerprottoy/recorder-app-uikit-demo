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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
        stopButton?.isEnabled = false
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "previewSegue" {
            let previewViewController = segue.destination as! PreviewViewController
            previewViewController.recordedAudioUrl = sender as! URL
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
        if flag {
            performSegue(withIdentifier: "previewSegue", sender: AudioUtils.getFileUrl())
        }
        else {
            print("Recording failed")
        }
    }
    
    @IBAction func startRecord(_ sender: UIButton) {
        statusLabel?.text = "Recording..."
        startButton.isEnabled = false
        stopButton.isEnabled = true
        AudioUtils.startRecord(delegate: self)
    }
    
    @IBAction func stopRecord(_ sender: UIButton) {
        statusLabel?.text = "Tap to start record..."
        stopButton.isEnabled = false
        startButton.isEnabled = true
        AudioUtils.stopRecord()
    }
}
