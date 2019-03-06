//
//  ViewController.swift
//  JoExam
//
//  Created by user146982 on 3/5/19.
//  Copyright © 2019 user146982. All rights reserved.
//

import UIKit

class DisplayViewController: UITableViewController, AddItemDelegate {
    var items = [Item]()
    
    func addItemCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemDone(_ controller: AddItemViewController, onDone item: Item) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]

        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //1
        if segue.identifier == "AddItem"{
            //2
            let controller = segue.destination as! AddItemViewController
            //3
            controller.delegate = self
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = Item()
        item1.name = "Pet my Dog"
        items.append(item1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        let item = items[indexPath.row]
        label.text = item.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let item = items[indexPath.row]
        item.toggle()
        swapAccessory(for: cell!, Item: item)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func swapAccessory(for cell: UITableViewCell, Item: Item) {
        if(Item.checked) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }


}

