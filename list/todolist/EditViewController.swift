//
//  EditViewController.swift
//  todolist
//
//  Created by Waren Muguel Mba Wega on 09/12/2022.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tache = data {
            ltextfield1.text = tache.nom
            ltextfield2.text = tache.description
        }
        // Do any additional setup after loading the view.
        ltextfield1.delegate = self
        ltextfield2.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //data!.nom = ltextfield1.text
        //data!.nom.ltextfield1 = ltextfield2.text!
    }
    @IBOutlet weak var ltextfield2: UITextField!
    @IBOutlet weak var ltextfield1: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var data: Todo?

}
