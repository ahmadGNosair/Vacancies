//
//  VacanciesViewCell.swift
//  Vacancies
//
//  Created by Ahmad Nosair on 13/09/2024.
//

import UIKit



class VacanciesViewCell: UITableViewCell {


    @IBOutlet weak var cellView: UIStackView!
    
    @IBOutlet weak var jobImage: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    
    
    @IBOutlet weak var Company: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    

    
    @IBOutlet weak var Description: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UIStuff ()
    }

    func UIStuff (){
        //cellView UI
        cellView.layer.cornerRadius = 25
        cellView.layer.backgroundColor = CGColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        self.layer.borderColor = colors().UNBlue.cgColor
        
        //jobImage UI
        jobImage.layer.cornerRadius = jobImage.bounds.height / 2
        jobImage.layer.cornerRadius = jobImage.frame.size.width / 2
        //jobImage.translatesAutoresizingMaskIntoConstraints = false
        jobImage.clipsToBounds = true
        jobImage.layer.borderWidth = 0
        jobImage.layer.borderColor = colors().UNBlue.cgColor
        
        //Title UI
        Title.textColor = colors().UNBlue
        Title.font = UIFont(name: "ProximaNovaCond-Extrabld", size: 18)
        
        //Description UI
        Description.isEditable = false
        Description.isScrollEnabled = false
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(JobImage : String , Title : String , Company : String , Date : String, Description : String){
        
        
        
        
        // Create a data task to fetch the image
        let url = URL(string: JobImage)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            // Handle error or empty data case
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            // Check if data exists and is valid
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                return
            }
            
            // Update the image on the main thread
            DispatchQueue.main.async {
                self.jobImage.image =  image
            }
        }.resume() // Start the download task
        self.Title.text = Title
        self.Company.text = Company
        self.Date.text = Date
        self.Description.text = Description
    }
             
      }

    
    

