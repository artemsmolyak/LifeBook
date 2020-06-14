//
//  ViewController.swift
//  Diary
//
//  Created by administrator on 12.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit


protocol MainControllerDelegate: class {
    func updateData()
}


class MainViewController: UITableViewController {
    
    let cellID = "cell"
    
    var notes: [NoteEntity]?
     

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Diary"
        
        fillNotesArrayFromDataBase()
 
        tableView.register( UINib(nibName: "MainTableCell", bundle: nil), forCellReuseIdentifier: cellID )
        
        setupSettingsBtn()
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NoteViewController else  { return }
        destination.delegate = self
    }
 
}



// MARK:: SETTINGS CONTROLLER

extension MainViewController {
    
    func setupSettingsBtn(){
        
       let icon = UIImage(named: "settings.png")?.withRenderingMode(.alwaysTemplate)
        
       navigationItem.leftBarButtonItem = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(buttonTappedAction))
    }
    
    
    @objc func buttonTappedAction(){
        self.navigationController?.pushViewController(SettingsVC(), animated:true)
    }
}

 


// MARK: DATABASE

extension MainViewController: MainControllerDelegate{
    
    func fillNotesArrayFromDataBase(){
         
        notes = DataBaseWrapper.getAll()
    }
    
    
    func updateData() {
        
        fillNotesArrayFromDataBase()
        self.tableView.reloadData()
    }
    
}


// MARK: TABLE

extension MainViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return notes!.count;
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MainTableCell
        
        let noteItem = notes?[indexPath.item]
        
        cell?.setup(id: noteItem!.id, date: noteItem!.date, text: noteItem!.text)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let cell = self.tableView.cellForRow(at: indexPath) as? MainTableCell
        
        
        let storyBoard = UIStoryboard(name: "Note", bundle:nil)
        let noteViewController = storyBoard.instantiateViewController(withIdentifier: "noteStoryBoard") as! NoteViewController
        
        
        noteViewController.setId( id: (cell?.noteId)! )
        self.navigationController?.pushViewController(noteViewController, animated:true)
    }
}
