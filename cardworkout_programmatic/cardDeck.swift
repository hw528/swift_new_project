//
//  cardDeck.swift
//  cardworkout_programmatic
//
//  Created by 吴昊东 on 10/13/24.
//

import UIKit

struct cardDeck {
    static var allCards: [UIImage] = {
        var cards = [UIImage]()
        for i in 1...52 {
            if let card = UIImage(named: "\(i)card") {
                cards.append(card)
            }
        }
        return cards
    }()
}
