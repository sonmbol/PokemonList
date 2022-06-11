//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var nameLabel: UILabel!
    
}
