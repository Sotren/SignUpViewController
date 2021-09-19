//
//  SignUpViewController.swift
//  LoginPageController
//
//  Created by стас on 16.09.2021.
//
import UIKit
//Ui sign up controller

class SignUpViewController: UIViewController
{
    
    @IBOutlet weak var phoneValidationLabel: UILabel!
    @IBOutlet weak var emailValidationLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    let user = User()
   
        override func viewDidLoad()
        {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 30
        passwordTextField.layer.cornerRadius = 30
        userPhoneTextField.layer.cornerRadius = 30
        }

        
    // fuc make sure that all fields are not nill
    
    private func alertEmptyFileds()
    {
    if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || userPhoneTextField.text!.isEmpty
     {
        let alert = UIAlertController(title: "Erorr", message: "All fields must be fild", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
     }
    }
    
    // Dictionary elements are key-value pairs for users
    var users = [[String:String]]()
    
   //func for read textfield.text and save them at users default dictionary
    @IBAction func SignUpButton(_ sender: UIButton) {
            alertEmptyFileds()
        let user =  ["email":emailTextField.text!,"password":passwordTextField.text!,
                     "phone":userPhoneTextField.text!]
            users.insert(user, at: 0)
            saveUsers()
    }
    // save users use Ns userdefalut
    func saveUsers(){
        UserDefaults.standard.setValue(self.users, forKey: "users")
        UserDefaults.standard.synchronize()
    }
   
    // MARK: Utils
    //check validation on textfield email and phone
    
    @IBAction func emailValidationCheck(_ sender: Any) {
        if isValidEmail(emailTextField.text!) {
            emailValidationLabel.isHidden = true
        }
        else {
            emailValidationLabel.isHidden = false }
    }
    
    @IBAction func phoneValidationCheck(_ sender: Any) {
        if isValidPhone(phone: userPhoneTextField.text!){
            phoneValidationLabel.isHidden = true}
        else{
            phoneValidationLabel.isHidden = false
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
        }
}
