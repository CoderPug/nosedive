//
//  ViewController.swift
//  nosedive
//
//  Created by Santex on 12/9/16.
//  Copyright © 2016 coderpug. All rights reserved.
//

import UIKit
import AVFoundation

enum Sound: String {
    case one = "nosedive_1_star"
    case two = "nosedive_2_stars"
    case three = "nosedive_3_stars"
    case four = "nosedive_4_stars"
    case five = "nosedive_5_stars"
}

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func play(sound type: Sound) {
        
        guard let soundPath = Bundle.main.path(forResource: type.rawValue, ofType: "mp3") else {
            print("No sound file")
            return
        }
        
        let alertSound = URL(fileURLWithPath: soundPath)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: alertSound)

        } catch {
            
            dump(error)
        }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @IBAction func playSound() {
     
        play(sound: .five)
    }

}

