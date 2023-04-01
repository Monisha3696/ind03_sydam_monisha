//
//  TableViewController.swift
//  ind03_sydam_monisha
//
//  Created by Monisha Sydam on 3/31/23.
//

import UIKit
import Foundation

var stateInfo:  [(String, String, String)] =
[
    ("Arkansas", "The Natural State", "52,068"),
    ("Alaska", "The Last Frontier", "571,951"),
    ("Arizona", "The Grand Canyon State", "113,635"),
    ("Alabama", "Yellowhammer State", "50,744"),
    ("California", "The Golden State", "155,959"),
    ("Colorado", "The Centennial State", "103,718"),
    ("Connecticut", "The Constitution State", "4,845"),
    ("Delaware", "The First State", "1,954"),
    ("Florida", "The Sunshine State", "53,927"),
    ("Georgia", "The Peach State", "57,906"),
    ("Hawaii", "The Aloha State", "6,423"),
    ("Idaho", "The Gem State", "82,747"),
    ("Illinois", "Prairie State", "55,584"),
    ("Indiana", "The Hoosier State", "35,867"),
    ("Iowa", "The Hawkeye State", "55,869"),
    ("Kansas", "The Sunflower State", "81,815"),
    ("Kentucky", "The Bluegrass State", "39,728"),
    ("Louisiana", "The Pelican State", "43,562"),
    ("Maine", "The Pine Tree State", "30,862"),
    ("Maryland", "The Old Line State", "9,774"),
    ("Massachusetts", "The Bay State", "7,840"),
    ("Michigan", "The Great Lakes State", "56,804"),
    ("Minnesota", "The North Star State", "79,610"),
    ("Mississippi", "The Magnolia State", "46,907"),
    ("Missouri", "The Show Me State", "68,886"),
    ("Montana", "The Treasure State", "145,552"),
    ("Nebraska", "The Cornhusker State", "76,872"),
    ("Nevada", "The Silver State", "109,826"),
    ("Wyoming", "The Equality or Cowboy State", "97,100"),
    ("New Hampshire", "The Granite State", "8,968"),
    ("New Jersey", "The Garden State", "7,417"),
    ("New Mexico", "The Land of Enchantment", "121,356"),
    ("New York", "The Empire State", "47,214"),
    ("North Carolina", "The Tar Heel State", "48,711"),
    ("North Dakota", "The Peace Garden State", "68,976"),
    ("Ohio", "The Buckeye State", "40,948"),
    ("Oklahoma", "The Sooner State", "68,667"),
    ("Oregon", "The Beaver State", "95,997"),
    ("Pennsylvania", "The Keystone State", "44,817"),
    ("Rhode Island", "The Ocean State", "1,045"),
    ("South Carolina", "The Palmetto State", "30,109"),
    ("South Dakota", "Mount Rushmore State", "75,885"),
    ("Tennessee", "The Volunteer State", "41,217"),
    ("Texas", "The Lone Star State", "261,797"),
    ("Utah", "The Beehive State", "82,144"),
    ("Vermont", "The Green Mountain State", "9,250"),
    ("Virginia", "The Old Dominion State", "39,594"),
    ("Washington", "The Evergreen State", "66,544"),
    ("West Virginia", "The Mountain State", "24,078"),
    ("Wisconsin", "The Badger State", "54,310")

]


//This is a class that generates a state entity that holds information regarding every state.
// Define a class named State
class State {
// Define properties for the State class
var stateName: String
var stateNickname: String
var stateFlag: UIImage
var stateMap: UIImage
var area: String
    
    //Initialize the State class with values for its properties
    init(stateName:String,stateNickname:String,stateFlag:UIImage,stateMap:UIImage,area:String ){
        self.stateName = stateName
        self.stateNickname = stateNickname
        self.stateFlag = stateFlag
        self.stateMap = stateMap
        self.area = area
    }
}

class TableViewController: UITableViewController {
    
    
    var stateDataCollection = [State]()
    @IBOutlet var stateDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        stateInfo.sort(by: <)
        // Loop through all the 50 states, create an object of a State and append them in the array
        // Get the stateflag image and statemap image form StateFlags folder
        // Images saved in such a way that no need to hard code all 50 state flags and state maps name
        for i in 0..<stateInfo.count{
            let state: (state: String, nickName : String, area: String) = stateInfo[i]
            stateDataCollection.append(State(stateName: state.state, stateNickname: state.nickName, stateFlag: UIImage(named: "StateFlags/\(state.state)")!, stateMap: UIImage(named: "StateFlags/\(state.state)_Map")!, area: state.area))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stateInfo.count
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellData", for: indexPath)
        
        // Configure the cell...
        // Get the first element of the stateInfo array, fetch the state name and nickname,
        // Present it in the cell
        let cellDetails: (state: String, nickName : String, area : String) = stateInfo[indexPath[1]]
        cell.textLabel?.text = cellDetails.state
        cell.detailTextLabel?.text = cellDetails.nickName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Move to the destination View Controller at every click on the row item
        performSegue(withIdentifier: "showDetail", sender: self)
        
    }
    
    // Send data to the Details Page View controller to show State map, area, name, flag on the screen
    // Get the stateObject from destination ViewController and pass complete State Object stored in the stateDataCollection Array
    // Each row clicked will have the related details such as state name, nickname, map, flag and area

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        destinationVC.stateObject = stateDataCollection[(stateDetails.indexPathForSelectedRow?.row)!]
    }
}
