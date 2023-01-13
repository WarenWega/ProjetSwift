//
//  TableViewCell.swift
//  todolist
//
//  Created by Waren Muguel Mba Wega on 23/11/2022.
//

import UIKit

//TableViewCell lié à la cellule prototype de mon MainStoryBoard
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var Titre: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var etat: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
