//
//  MessageCell.swift
//  MessagingApp
//
//  Created by Javier Calderon Jr. on 12/17/19.
//  Copyright © 2019 LamdaLearningEnviorment. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

   let messageLabel = UILabel()
        let bubbleBackgroundView = UIView()
        
        var leadingConstraint: NSLayoutConstraint!
        var trailingConstraint: NSLayoutConstraint!
        
        var message: Message! {
            didSet {
                bubbleBackgroundView.backgroundColor = message.isIncoming ? .white : .blue
                messageLabel.textColor = message.isIncoming ? .black : .white
                
                messageLabel.text = message.text
                
                if message.isIncoming {
                    leadingConstraint.isActive = true
                    trailingConstraint.isActive = false
                } else {
                    leadingConstraint.isActive = false
                    trailingConstraint.isActive = true
                }
            }
        }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            backgroundColor = .clear
            bubbleBackgroundView.backgroundColor = .yellow
            bubbleBackgroundView.layer.cornerRadius = 12
            bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.numberOfLines = 0
            
            addSubview(bubbleBackgroundView)
            addSubview(messageLabel)
            
            // lets set up some constraints for our label
            let constraints = [
                messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                
                bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
                bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
                bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
                bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
                ]
            NSLayoutConstraint.activate(constraints)
            
            leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
            leadingConstraint.isActive = false
            
            trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
            trailingConstraint.isActive = true
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }
