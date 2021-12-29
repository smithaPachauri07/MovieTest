//
//  ViewController.swift
//  Movieapp
//
//  Created by Smitha Pachauri on 28/12/21.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    var arrMovieModel = [Result]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
       
        getServiceForMovie()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("self.arrMovieModel.count",self.arrMovieModel.count)
        return  self.arrMovieModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.lbltitle.text = arrMovieModel[indexPath.row].title
        cell.titleDescription.text = arrMovieModel[indexPath.row].overview
        print(" cell.titleDescription.text",arrMovieModel[indexPath.row].overview.count)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(arrMovieModel[indexPath.row].overview.count > 100){
            return  UITableView.automaticDimension
        }
        else{
            return 150
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier:"MovieDescriptionVC") as! MovieDescriptionVC
        secondViewController.arrMovieModel = arrMovieModel[indexPath.row]
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}
extension ViewController{
    func getServiceForMovie(){
       

        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do {
            let movie = try JSONDecoder().decode (MovieModel.self, from: data)
                self.arrMovieModel = movie.results
                print(" self.arrMovieModel", self.arrMovieModel)
                DispatchQueue.main.async {
                  
                self.tableView.reloadData()
                }
                } catch let error {}
            
            
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
}
