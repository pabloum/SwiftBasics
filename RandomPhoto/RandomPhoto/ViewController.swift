//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Pablo Uribe Montoya on 25/04/23.
//

import UIKit

class ViewController : UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemCyan
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let colors: [UIColor] = [
        .systemOrange,
        .systemRed,
        .systemYellow,
        .systemGreen,
        .systemIndigo,
        .secondarySystemFill
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        view.addSubview(imageView)
        imageView.frame = CGRect(
            x: 0,
             y: 0,
             width: 300,
             height: 300)
        
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
              x: 30,
              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
              width: view.frame.size.width-60,
              height: 55)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/?Cryptocurrency&1";
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf:  url) else {
            return
        }
        imageView.image = UIImage(data: data)
        imageView.image = UIImage(data: data)
    }


}

