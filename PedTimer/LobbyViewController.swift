//
//  LobbyViewController.swift
//  PedTimer
//
//  Created by 松下怜平 on 2020/02/21.
//  Copyright © 2020 com.iitech. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newPedoTimer() {
        performSegue(withIdentifier: "newPedoTimer", sender: nil)
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
