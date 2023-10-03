//
//  HomeCellTableView.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

class HomeCellTableView: UITableViewCell {

    @IBOutlet weak var viewCellHome: UIView!
    
    @IBOutlet weak var imageHomeCell: UIImageView!
  
    @IBOutlet weak var labelHomeCell: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCellHome.layer.cornerRadius = 4.0
    }

    override func prepareForReuse() { // Limpia las celdas para meter los nuevos datos
        super.prepareForReuse() //Siempre enun overried super
        imageHomeCell.image = nil
        labelHomeCell.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
