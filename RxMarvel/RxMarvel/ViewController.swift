//
//  ViewController.swift
//  RxMarvel
//
//  Created by Nicholas Babo on 09/05/18.
//  Copyright © 2018 Nicholas Babo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        APIManager.getCharacters()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

