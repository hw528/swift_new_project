//
//  cardWorkoutVC.swift
//  cardworkout_programmatic
//
//  Created by 吴昊东 on 10/12/24.
//

import UIKit

class cardWorkoutVC: UIViewController {

    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundcolor: .systemRed, title: "Stop!")
    let startButton = CWButton(backgroundcolor: .systemGreen, title: "Start")
    let rulesButton = CWButton(backgroundcolor: .systemBlue, title: "Rules")
    
    var timerstatus: Bool = false
    var startButtonTapped: Bool = false
    
    var cards : [UIImage] = cardDeck.allCards
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        
    }
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureStartButton()
        configureRulesButton()
        
    }
    
    
    @objc func startTimer(){
        if !timerstatus{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(randomCard), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func randomCard(){cardImageView.image = cards.randomElement()}
    
    @objc func stopTimer(){timer.invalidate()}
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "1card")
        
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }

    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector (stopButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor,constant: 30)])
    }

    @objc func changeStartTitle(){
        startButton.setTitle("Restart", for: .normal)
    }
    
    func configureStartButton(){
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        startButton.addTarget(self, action: #selector (changeStatus), for:.touchUpInside)
        
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 115),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            startButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor,constant: 20)            ])
    }
    
    @objc func changeStatus(){
        timerstatus = true
        startButtonTapped = true
        stopButton.addTarget(self, action: #selector(changeStartTitle), for: .touchUpInside)
    }
    
    @objc func stopButtonTapped() {
        timerstatus = false
        }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(showRules), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor,constant: 20)            ])
    }
    
    @objc func showRules(){present(RulesVCViewController(), animated: true )}
    
}
