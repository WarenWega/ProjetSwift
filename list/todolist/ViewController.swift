//
//  ViewController.swift
//  todolist
//
//  Created by Waren Muguel Mba Wega on 23/11/2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate {
    
    
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataRecherche.count
    }   

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
       
       // Configure the cell’s contents.
        let row = indexPath.row
        cell.Titre.text = dataRecherche[row].nom
           
       
       return cell
    }
    
    //Chargement des lignes et de sections à partir de de mon tableau de données
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style:.destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.dataRecherche.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
            
        })
        ])
        return configuration
    }
    var data : [Todo] = []
    var dataRecherche : [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Initialisation du tableau data
        for i in 1...5 {
            let a = "Ceci est la description de la tache " + String(i)
            let b = "Tache" + String(i)
            let d = Todo(description: a, nom: b, date: Date())
            data.append(d)
        }
        myTableView.dataSource = self
        myTableView.delegate = self
        search.delegate = self
        
        data = data.sorted(by: {$0.date < $1.date})
        
        dataRecherche = data
    }
    
    //Préparer les instructions qui vont être executer au moment de l'affichage de la deuxième vue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = myTableView.indexPathForSelectedRow!.row
            vc.data = dataRecherche [row]
        }
    }
    

    @IBOutlet weak var myTableView: UITableView!
    
    //Ajout d'une tache
    @IBAction func unwindToSave(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController{
            if let tache = vc.data{
                data.append(tache)
                data = data.sorted(by: {$0.date < $1.date})//Tri d'en fonction de la date
                dataRecherche = data
                myTableView.reloadData()
            }
        }
        // Use data from the view controller which initiated the unwind segue
    }
    @IBAction func unwindToCancel(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    
    @IBOutlet weak var search: UISearchBar!
    
    
    //On utilise le nom de la tâche pour effectuer la recherche
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataRecherche = []
        if searchText == ""{
            dataRecherche = data
        } else {
            for todo in data {
                if todo.nom.contains(searchText) {
                    dataRecherche.append(todo)
                }
            }
        }
        myTableView.reloadData() // rechargement des données
    }
    
    
    

    @IBAction func switchvalue(_ sender: UISwitch) {
    }
}

