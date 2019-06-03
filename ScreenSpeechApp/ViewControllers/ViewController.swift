//
//  ViewController.swift
//  ScreenSpeechApp
//
//  Created by vit on 6/3/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speechTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupBoldSpeechTextLabel()
        
        for family in UIFont.familyNames {
            print("\(family)")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }

    private func setupBoldSpeechTextLabel() {
        /*
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .bold)]
        let attributedString = NSMutableAttributedString(string: "TheSpeech", attributes: attributes)
        let normalString = NSMutableAttributedString(string: "(new users)")
        attributedString.append(normalString)
        boldSpeechTextLabel.attributedText = attributedString
        */
 
        //let labelText = speechTextLabel.text
        
        //let additionalText = "(new users)"
        //additionalText = UIFont(name: "Dax-Pro", size: 22)
        //speechTextLabel.font = labelText + additionalText
    }
}
