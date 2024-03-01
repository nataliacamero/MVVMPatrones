//
//  DetailViewController.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

//MARK: - PROTOCOLO -
protocol DetailViewControllerProtocol: AnyObject {
    func update(image: String?)
    func update(name: String?)
    func update(job: String?)
    func update(description: String?)
}


//MARK: - CLASE -
class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!
    @IBOutlet weak var jobDetail: UILabel!
    
    //Comunicacion con el modelo
    var viewModel: DetailViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
}


//MARK: - EXTENSION -
extension DetailViewController: DetailViewControllerProtocol {
    func update(image: String?) {
        detailImage.image = UIImage(named: image ?? "")
    }
    
    func update(name: String?) {
        nameDetail.text = name ?? ""
    }
    
    func update(job: String?) {
        jobDetail.text = job ?? ""
    }
    
    func update(description: String?) {
        descriptionDetail.text = description ?? ""
    }
}


