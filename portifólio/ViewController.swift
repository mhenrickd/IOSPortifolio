//
//  ViewController.swift
//  portifólio
//
//  Created by Matheus Henrick Dias on 18/03/20.
//  Copyright © 2020 Matheus Henrick Dias. All rights reserved.
//

import UIKit
import iCarousel

class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    var quadros = ["photo1","photo2","photo3","photo4"]
    @IBOutlet weak var carousel: iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carousel.type = .rotary
        carousel.dataSource = self
        carousel.delegate = self
        carousel.autoscroll = 1
        
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return quadros.count
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imagem: UIImageView
        
        if let view = view as? UIImageView{
            //ja existe uma view q pode ser reutilizada
            imagem = view
        } else {
            imagem = UIImageView()
            imagem.frame = carousel.frame
            imagem.contentMode = .scaleAspectFill
            imagem.clipsToBounds = true
            imagem.layer.cornerRadius = 50
        }
        imagem.image = UIImage(named: quadros[index])
        return imagem
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch option {
        case .spacing:
            return value * 1.2
        default:
            return value
        }
    }


}

