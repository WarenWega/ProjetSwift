//
//  EditViewController.swift
//  todolist
//
//  Created by Waren Muguel Mba Wega on 05/12/2022.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        
            

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
       // let vc = navigationController?.viewControllers[0]
        //(vc as! ViewController).data.append(Todo(description: ltextfield2.text!, nom: ltextfield1.text!))
        //data!.nom = ltextfield1.text
        //data!.nom.ltextfield1 = ltextfield2.text
    }
    @IBOutlet weak var ltextfield1: UITextField!
    
    @IBOutlet weak var ltextfield2: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        data = Todo(description: ltextfield2.text!, nom: ltextfield1.text!, date: datePicker.date)
    }
    var data: Todo?
    
    
}
