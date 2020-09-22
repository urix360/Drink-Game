//
//  ViewController.swift
//  Code02
//
//  Created by Uri Vishnevski on 15/07/2020.
//  Copyright © 2020 Uri Vishnevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    var Bcolor:UIColor!
    var TColor:UIColor!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //hide the navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //hide the navigation shadow
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        
        Bcolor=playButton.backgroundColor
        
        
    }
    
    @IBAction func colorPress(_ sender: UIButton) {
        sender.backgroundColor = Bcolor
    }
    
    @IBAction func holdColor(_ sender: UIButton) {
        sender.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    
    
    
}


