//
//  HomeCellTableView.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 6/10/23.
//

import UIKit

class HomeCellTableView: UITableViewCell {
    @IBOutlet weak var cellHomeView: UIView!
    @IBOutlet weak var cellHomeImage: UIImageView!
    @IBOutlet weak var cellHomeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellHomeView.layer.cornerRadius = 4.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellHomeName.text = nil
        cellHomeImage.image = nil
    }
    
    func updateViews(data: CharacterModel?) {
        update(name: data?.name)
        update(image: data?.image)
    }
    
    private func update(name: String?) {
        cellHomeName.text = name ?? ""
    }
        
    private func update(image: String?) {
        cellHomeImage.image = UIImage(named: image ?? "")
    }
}
