//
//  PedoMeterViewController.swift
//  PedTimer
//
//  Created by 松下怜平 on 2020/02/21.
//  Copyright © 2020 com.iitech. All rights reserved.
//

import UIKit
import CoreMotion

class PedoMeterViewController: UIViewController {

    var time: Float = 0.0
    var timer: Timer = Timer()
    var newPedometer: CMPedometer!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var stepsLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            newPedometer = CMPedometer()
            newPedometer.startUpdates(from: NSDate() as Date, withHandler: { (pedometerDate, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let date = pedometerDate else {
                    return
                }
                let mySteps = date.numberOfSteps
                DispatchQueue.main.async {
                    self.stepsLabel.text = "\(mySteps)歩"
                }
                
            })
        }else {
            if timer.isValid {
                timer.invalidate()
            }
        }
    }
    
    @objc func up() {
        time = time + 0.1
        timeLabel.text = String(format: "%.1f", time)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
