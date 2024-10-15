//
//  CWButton.swift
//  cardworkout_programmatic
//
//  Created by 吴昊东 on 10/12/24.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundcolor: UIColor, title:String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundcolor
        setTitle(title, for: .normal)
        configure()
    }
    
    
   func configure() {
       layer.cornerRadius = 10
       titleLabel?.font = .systemFont(ofSize: 19, weight: .semibold)
       setTitleColor(.white, for: .normal)
       translatesAutoresizingMaskIntoConstraints = false
    }

}
