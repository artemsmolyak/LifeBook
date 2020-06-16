//
//  SettingsVC.swift
//  Diary
//
//  Created by Di Gain on 12.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    let fontCell = FontCell()
    let securitySection = UITableViewCell()
    let themeSection = UITableViewCell()
    
    let securitySwitch = UISwitch(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 50
        tableView.backgroundColor = UIColor(red: 227/255, green: 226/255, blue: 226/255, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Font"
        case 1: return "Security"
        case 2: return "Theme"
        default: return "No section"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        default: fatalError("Unknown number of sections")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            fontCell.backgroundColor = .white
            return fontCell
        case 1:
            let cell = securitySection
            cell.textLabel?.text = "Enable password"
            securitySwitch.setOn(false, animated: true)
            securitySwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            cell.accessoryView = securitySwitch
            return cell
        case 2:
            let cell = themeSection
            cell.textLabel?.text = "Classic"
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
             fatalError("Unknown section")
        }
    }
}

extension SettingsVC {
    @objc func switchChanged() {
        if securitySwitch.isOn {
            let vc = PasswordVC()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
