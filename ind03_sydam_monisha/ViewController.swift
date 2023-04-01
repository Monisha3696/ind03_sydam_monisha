//
//  ViewController.swift
//  ind03_sydam_monisha
//
//  Created by Monisha Sydam on 3/31/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stateFlag: UIImageView!
    
    @IBOutlet weak var stateName: UILabel!
    
    @IBOutlet weak var stateMap: UIImageView!
    
    @IBOutlet weak var stateArea: UILabel!
    // Declare a variable to hold a State object
    var stateObject: State?
    
    // This function is called after the view controller loads its view hierarchy into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the state name label to the state name of the stateObject
        stateName.text = stateObject?.stateName
        
        // Set the state area label to the area of the stateObject, with " Sq.Miles" appended
        stateArea.text = stateObject!.area + " Sq.Miles"
        
        // Set the state flag image to the stateFlag property of the stateObject
        stateFlag.image = stateObject?.stateFlag
        
        // Set the state map image to the stateMap property of the stateObject
        stateMap.image = stateObject?.stateMap
    }


}

