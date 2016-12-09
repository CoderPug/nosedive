//
//  RateViewController.swift
//  nosedive
//
//  Created by Santex on 12/9/16.
//  Copyright © 2016 coderpug. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate: class {
    
    func rateViewControllerDelegateStarsSelected(_ rateViewController: RateViewController, selectedStars: Int)
}

class RateViewController: UIViewController {

    var startPoint: CGPoint?
    var selectedStars: Int = 0
    weak var delegate: RateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
    }

}

extension RateViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in: view) else {
            return
        }
        
        startPoint = point
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in: view) else {
            return
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in: view),
            let startPoint = startPoint else {
            return
        }
        
        let dif = point.x - startPoint.x
        if (dif > 0) {
            selectedStars = Int(dif / 50)
        }
        delegate?.rateViewControllerDelegateStarsSelected(self, selectedStars: selectedStars)
    }
}
