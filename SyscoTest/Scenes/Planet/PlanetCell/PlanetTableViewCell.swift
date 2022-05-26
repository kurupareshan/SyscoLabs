//
//  PlanetTableViewCell.swift
//  SyscoTest
//
//  Created by kurupareshan pathmanathan on 5/25/22.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    var imageName = ["desert.jpeg","grass.jpeg","jungle.jpeg","ice.jpeg","swamp.jpeg","gas.jpeg","lake.jpeg","mountain.jpeg","city.jpeg","ocean.jpeg"]
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(result: Result, index: Int) {
        icon.layer.borderWidth = 1.0
        icon.layer.masksToBounds = false
        icon.layer.borderColor = UIColor.white.cgColor
        icon.layer.cornerRadius = icon.frame.size.width / 2
        icon.clipsToBounds = true
        nameLabel.text = result.name
        climateLabel.text = result.climate
        let name = imageName[index]
        icon.image = UIImage(named: name)
    }
    
}
