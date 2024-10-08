//
//  FirstScreenViewController.swift
//  Stryde
//
//  Created by George Xue on 9/21/24.
//

import UIKit

class FirstScreenViewController: UIViewController {
    let nextButton = UIButton()
    let titleLabel = UILabel()
    let runningStickman = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 246/255.0, green: 244/255.0, blue: 210/255.0, alpha: 1.0)

        setupTitleLabel()
        setupButton()
        setupStickman()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Bottom Curve Shape
        let bottomCurveView = UIView()
        bottomCurveView.backgroundColor = UIColor(red: 212/255, green: 224/255, blue: 155/255, alpha: 1.0)  // #D4E09B
        bottomCurveView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomCurveView)
        view.sendSubviewToBack(bottomCurveView)
        
        NSLayoutConstraint.activate([
            bottomCurveView.heightAnchor.constraint(equalToConstant: 300),  // Increased height for full oval
            bottomCurveView.widthAnchor.constraint(equalToConstant: view.frame.width * 2),  // Make it twice the screen width for the oval effect
            bottomCurveView.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center it horizontally
            bottomCurveView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
                
        // Apply corner rounding to create the curved effect
        bottomCurveView.layer.cornerRadius = 400
        bottomCurveView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bottomCurveView.layer.masksToBounds = true

        // Do any additional setup after loading the view.
        view.bringSubviewToFront(runningStickman)
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "STRYDE"
        titleLabel.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        titleLabel.textColor = UIColor(red: 139/255, green: 69/255, blue: 19/255, alpha: 1.0) // Custom brown
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    
    func setupButton() {
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Create Account", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        nextButton.backgroundColor = UIColor(red: 106/255, green: 176/255, blue: 76/255, alpha: 1.0)
        nextButton.layer.cornerRadius = 8
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        nextButton.setTitleColor(.white, for: .normal)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            nextButton.widthAnchor.constraint(equalToConstant: 225),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupStickman() {
        // Assuming the image is named "runningPerson.png" in your asset catalog
        runningStickman.image = UIImage(named: "music-note")
        runningStickman.contentMode = .scaleAspectFit
        runningStickman.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(runningStickman)
            
        // Constraints to position the image on top of the bottomCurveView
        NSLayoutConstraint.activate([
            runningStickman.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            runningStickman.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -240),
            runningStickman.widthAnchor.constraint(equalToConstant: 200),
            runningStickman.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func goToNextScreen() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            let rootViewController = sceneDelegate.rootViewController
            rootViewController.title = "Sign Up"
            navigationController?.pushViewController(rootViewController, animated: true)
        }
    }
}
