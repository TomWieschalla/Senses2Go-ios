//
//  MicroViewController.swift
//  Senses2Go
//
//  Created by Admin on 25.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit
import AVFoundation

class MicroViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    var recordSession: AVAudioSession!
    var recorder: AVAudioRecorder!
    var player = AVAudioPlayer()
    var recorded = false

    @IBOutlet weak var startStopPlayButton: UIButton!
    @IBOutlet weak var statusPlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mikrofon"
        
        recordSession = AVAudioSession.sharedInstance()
        
        do {
            try recordSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordSession.setActive(true)
            recordSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        self.loadFailUI()
                    }
                }
            }
        } catch {
            self.loadFailUI()
        }
    }

    @IBAction func startStopRecord(_ sender: Any) {
        
        if !recorder.isRecording {
            recorder.record()
            startStopPlayButton.backgroundColor = UIColor.red
            startStopPlayButton.layer.cornerRadius = 20
            startStopPlayButton.titleLabel?.text = "Stop"
            statusPlayButton.alpha = 0.25
        } else {
            recorder.stop()
            startStopPlayButton.backgroundColor = UIColor.blue
            startStopPlayButton.layer.cornerRadius = 40
            startStopPlayButton.titleLabel?.text = "Start"
            recorded = true
            statusPlayButton.alpha = 1
        }
        
    }
    
    @IBAction func playStopMemo(_ sender: Any) {
        if recorded && !recorder.isRecording {
            do {
                try player = AVAudioPlayer(contentsOf: recorder.url)
                player.delegate = self
                player.play()
            } catch {
                print("Error occured while playing memo!")
            }
            
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let alert = UIAlertView(title: "Ende", message: "Aufnahme wurd erfolgreich abgespielt!", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        let alert = UIAlertView(title: "Fertig", message: "Aufnahme war erfolgreich!", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
    
    
    func loadRecordingUI() {
        self.startStopPlayButton.layer.borderWidth = 2
        self.startStopPlayButton.layer.borderColor = UIColor.clear.cgColor
        self.startStopPlayButton.backgroundColor = UIColor.blue
        self.startStopPlayButton.layer.cornerRadius = 40
        
        statusPlayButton.layer.borderWidth = 2
        statusPlayButton.layer.borderColor = UIColor.clear.cgColor
        statusPlayButton.layer.cornerRadius = 20
        
        if !recorded {
            statusPlayButton.alpha = 0.25
        }
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            recorder = try AVAudioRecorder(url: getUrl(), settings: settings)
            recorder.delegate = self
        } catch {
            print("Error occured while recording memo!")
        }
    }
    
    func getUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var directory = paths[0]
        directory.appendPathComponent("record.m4a")
        return directory
    }
    
    func loadFailUI() {
        
    }
}
