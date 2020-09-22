//
//  gameVC.swift
//  Lets Drink!
//
//  Created by Uri Vishnevski on 18/07/2020.
//  Copyright © 2020 Uri Vishnevski. All rights reserved.
//
import DWAnimatedLabel
import UIKit

class gameVC: UIViewController {

    
    
    @IBOutlet weak var textArea: UIView!
    @IBOutlet weak var textShow: UILabel!
    
    private var missions:[String]!
    private var counter:intmax_t!
    
    
    @IBOutlet weak var countLabel: DWAnimatedLabel!
    private var timer = Timer()
    var time=3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide the navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        textArea.layer.cornerRadius = 20
        
        countLabel.animationType = .typewriter
        
        missions = getdata()
        missions.shuffle()
        counter=0
        
    }
    
    func getdata() -> [String]?{
        var items:[String] = []
        if let path = Bundle.main.path(forResource: "DB", ofType: "json"){
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            guard let dic = json as? [String: Any] else {return nil}
            for item in dic{
                guard let temp = item.value as? String else {return nil}
                items.append(temp)
            }
            
        }
        catch{
            print("faild to get data")
        }
        }
        else{
            print("nil")
        }
        return items
    }
    
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        textShow.text=""
        countLabel.text=String(time)
        countLabel.startAnimation(duration: 0.25) {}
        timer = Timer.scheduledTimer(timeInterval: 0.30, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @objc func tick(){
        if time == 1 {
            timer.invalidate()
            countLabel.text=""
            time=3
            textShow.text=missions[counter]
            counter+=1
            if missions.count == counter{
                counter=0
                missions.shuffle()
            }
        }
        else{
            time-=1
        countLabel.text = String(time)
            countLabel.startAnimation(duration: 0.25) {}
        }
    }
    
    
}
