//
//  DetailViewController.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

//MARK: - PROTOCOLO -
protocol DetailViewControllerProtocol: AnyObject {
    func updateViews(data: CharacterModel?)
}


//MARK: - CLASE -
class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!
    @IBOutlet weak var jobDetail: UILabel!
    
    var viewModel: DetailViewModelProtocol?//Comunicacion con el modelo
    
//    var dataCharacter: CharacterModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        if viewModel?.character != nil {
            viewModel?.onViewsLoaded()
        }
        
    }
   
    private func update(image: String?) {
        detailImage.image = UIImage(named: image ?? "")
    }
    
    private func update(name: String?) {
        nameDetail.text = name ?? ""
    }
    
    private func update(job: String?) {
        jobDetail.text = job ?? ""
    }
    
    private func update(description: String?) {
        descriptionDetail.text = description ?? ""
    }
}


//MARK: - EXTENSION -
extension DetailViewController: DetailViewControllerProtocol {
    func updateViews(data: CharacterModel?) {
        guard (data != nil) else {return}
        update(image: data?.image)
        update(name: data?.name)
        update(job: data?.job)
        update(description: data?.description)
    }
    
    
}


