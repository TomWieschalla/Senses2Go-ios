//
//  SoundViewController.swift
//  Senses2Go
//
//  Created by Admin on 25.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var audioPlayer: AVAudioPlayer! = nil

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lautsprecher"
        trackLabel.text = "Guitar"
        let path = Bundle.main.resourcePath?.appending("/guitar.mp3")
        let mp3URL = NSURL(fileURLWithPath: path!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SoundViewController.updateAudioProgressView), userInfo: nil, repeats: true)
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        } catch {
            print("An error occurred while trying to extract audio file")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    
    func updateAudioProgressView() {
        if audioPlayer.isPlaying {
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    
    @IBAction func backwardButtonClicked(_ sender: Any) {
        var time = audioPlayer.currentTime
        time -= 5.0
        if time > audioPlayer.duration {
            audioPlayer.stop()
            let image = UIImage(named: "Play-50.png")
            startButton.setImage(image, for: .normal)
        } else {
            audioPlayer.currentTime = time
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        audioPlayer.stop()
        let image = UIImage(named: "Play-50.png")
        startButton.setImage(image, for: .normal)
        audioPlayer.currentTime = 0
        progressView.progress = 0.0
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
            let image = UIImage(named: "Pause-50.png")
            startButton.setImage(image, for: .normal)
        } else {
            audioPlayer.pause()
            let image = UIImage(named: "Play-50.png")
            startButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func forwardButtonClicked(_ sender: Any) {
        var time = audioPlayer.currentTime
        time += 5.0
        if time > audioPlayer.duration {
            audioPlayer.stop()
            let image = UIImage(named: "Play-50.png")
            startButton.setImage(image, for: .normal)
        } else {
            audioPlayer.currentTime = time
        }
    }
}
