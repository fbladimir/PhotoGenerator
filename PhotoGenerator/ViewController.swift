//
//  ViewController.swift
//  PhotoGenerator
//
//  Created by Franklin Bladimir on 12/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    //Creating space for the images
    private let imageView: UIImageView = {
        let imageView = UIImageView()
            
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
            return imageView
    }()
    
    //creating space for the button
    private let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        
        
        
            return button
    }()
    
    //Creating an array of colors 
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemGray,
        .systemOrange,
        .systemTeal
    ]

    //View to see the actual application
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background of app
        view.backgroundColor = .systemPink
        
        //ability to see the image
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        //ability to see the button
        view.addSubview(button)
        
        //calling randomphoto function and using button function
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    //------------FUNCTIONS-------------------//
    
    //function needed when button is being pressed
    @objc func didTapButton() {
        getRandomPhoto()
        
        //this will change to one of the colors in the colors array
        view.backgroundColor = colors.randomElement()
    }
    
    //button layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect( x:30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width - 60,
                               height: 55)
    }
    
    //function to get random photos
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image = UIImage(data: data)
    }


}

