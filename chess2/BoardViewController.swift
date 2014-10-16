//
//  MasterViewController.swift
//  chess2
//
//  Created by Berkus on 15/10/14.
//  Copyright (c) 2014 Berkus. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    var board: BoardView?

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

