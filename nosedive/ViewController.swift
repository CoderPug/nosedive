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
    var rateViewController: RateViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showContainer" {
            
            guard let rateVC = segue.destination as? RateViewController else {
                return
            }

            rateViewController = rateVC
            rateViewController?.delegate = self
        }
    }
    
    //  MARK:
    
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

}

extension ViewController: RateViewControllerDelegate {
    
    func rateViewControllerDelegateStarsSelected(_ rateViewController: RateViewController, selectedStars: Int) {
        
        print(selectedStars)
        
        play(sound: .five)
    }
    
}

