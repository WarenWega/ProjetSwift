//
//  DetailViewController.swift
//  todolist
//
//  Created by Waren Muguel Mba Wega on 30/11/2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tache = data{
            det_nom.text = tache.nom
            det_desc.text = tache.description
            
            let formater = DateFormatter()
            formater.dateFormat = "dd/MM/yyyy"
            det_date.text = formater.string(from: tache.date)
            
        }else{
            det_nom.text="ERROR 404"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var det_nom: UILabel!
    
    @IBOutlet weak var det_desc: UILabel!
    
    @IBOutlet weak var det_date: UILabel!
    
    var data: Todo?
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController{
            vc.data = data
        }
    }
    
    @IBAction func unwindTocancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            vc.dismiss(animated: true, completion : nil)
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func unwindTosave(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}
