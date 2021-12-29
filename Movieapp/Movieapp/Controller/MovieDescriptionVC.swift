//
//  MovieDescriptionVC.swift
//  Movieapp
//
//  Created by Smitha Pachauri on 28/12/21.
//

import UIKit

class MovieDescriptionVC: UIViewController {
    var arrMovieModel : Result!
    
    @IBOutlet weak var lblMoviename: UILabel!
    
    @IBOutlet weak var lblMovieyear: UILabel!
    
    @IBOutlet weak var lblMovieDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMoviename.text = arrMovieModel.title
        lblMovieyear.text = arrMovieModel.releaseDate
        lblMovieDescription.text =
        arrMovieModel.overview
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
