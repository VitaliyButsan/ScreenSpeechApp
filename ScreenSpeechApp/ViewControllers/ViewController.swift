//
//  ViewController.swift
//  ScreenSpeechApp
//
//  Created by vit on 6/3/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit

enum WrongInput {
    
    enum Name: String {
        case Title = "Wrong input!"
        case Message = "Need more than 3 characters"
    }
    
    enum Password: String {
        case Title = "Wrong input!"
        case Message = "Need more than 6 ang less than 16 characters input"
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var speechTextLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        print(validation())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFields()
    }
    
    private func setUpTextFields() {
        nameTextField.setLeftPaddingPoints(10)
        userNameTextField.setLeftPaddingPoints(10)
        emailTextField.setLeftPaddingPoints(10)
        passwordTextField.setLeftPaddingPoints(10)
        
        nameTextField.returnKeyType = .next
        userNameTextField.returnKeyType = .next
        emailTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
    }
    
    private func validation() -> ValidationData {
        var name = ""
        var pass = ""

        if let nameText = nameTextField.text, nameText.count > 3 {
            name = nameText
        }
        
        if let passText = passwordTextField.text, passText.count > 5, passText.count < 17 {
            pass = passText
        }

        let validData = ValidationData.init(name: name, userName: userNameTextField.text, email: emailTextField.text, password: pass)
        
        return validData
    }
    
    private func alertHandler(withTitle: String, withMessage: String) {
        let alert = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    // changed textField focus by pressing return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     
        if textField.tag == 0, let text = textField.text, text.count <= 3 {
            alertHandler(withTitle: WrongInput.Name.Title.rawValue, withMessage: WrongInput.Name.Message.rawValue)
            
        } else if textField.tag == 3, let text = textField.text, text.count < 6 || text.count > 16 {
            alertHandler(withTitle: WrongInput.Password.Title.rawValue, withMessage: WrongInput.Password.Message.rawValue)
            textField.returnKeyType = UIReturnKeyType.done
        }

        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {

            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return false
    }
    
    // to set only alphabetic and integer characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 3 {
            let set = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMONPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ").inverted
            return string.rangeOfCharacter(from: set) == nil
        } else {
            return true
        }
    }
    
}


// left-rigth paddings inside textFields
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
