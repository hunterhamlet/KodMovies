//
//  ViewController.swift
//  KodMovies
//
//  Created by Hamon on 26/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var width : CGFloat = UIScreen.main.bounds.width
    lazy var height : CGFloat = UIScreen.main.bounds.height
    
    private let tlAppName = UILabel()
    private let iVLogoApp = UIImageView()
    private let bMoveTo = UIButton()
    private var country = UITextField()
    
    var busqueda = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        view.addSubview(iVLogoApp)
        iVLogoApp.image = UIImage(named: "ic_login")
        iVLogoApp.addAnchorsAndCenter(centerX: true, centerY: nil, width: width / 2, height: width / 2, left: nil, top: height / 4, right: nil, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        tlAppName.text = "Las mejores peliculas"
        tlAppName.textAlignment = .center
        tlAppName.font = .boldSystemFont(ofSize: 30)
        tlAppName.adjustsFontSizeToFitWidth = true
        view.addSubview(tlAppName)
        tlAppName.addAnchorsAndCenter(centerX: true, centerY: nil, width: 3*width / 4, height: height/20, left: nil, top: height / 4 + width / 2, right: nil, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        country = UITextField(frame: CGRect(x: width/10, y: 2*height/3, width: 8*width/10, height: height/20))
        country.backgroundColor = .systemGray4
        country.layer.cornerRadius = 10
        country.textAlignment = .center
        country.placeholder = "Introduce la pelicula"
        view.addSubview(country)
        
        view.addSubview(bMoveTo)
        bMoveTo.setTitle("Acceder...", for: .normal)
        bMoveTo.setTitleColor(.white, for: .normal)
        bMoveTo.layer.cornerRadius = 10
        bMoveTo.backgroundColor = .blue
        bMoveTo.addTarget(self, action: #selector(moveToMoviesList), for: .touchUpInside)
        bMoveTo.addAnchorsAndSize(width: nil, height: 50, left: 16, top: 5*height/18, right: 16, bottom: nil, withAnchor: .top, relativeToView: tlAppName)
        
    }
    
    
    @objc func moveToMoviesList() {
        let screenList = ListViewController()
        screenList.modalPresentationStyle = .fullScreen
        present(screenList, animated: true, completion: nil)
        busqueda = country.text!
        print(country.text!)
        print("Tocamos el bot??n, mostrando data:")
        
        
        //Aqu?? va el API
        let movieUrl = "https://betterimdbot.herokuapp.com/"
        
        let urlString = "\(movieUrl)?q=\(String(busqueda))"
            
        // Hacemos los 4 pasos
                
        //1.Crear un URL
        if let url = URL(string: urlString) {
        
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Darle la session una tarea
            let task = session.dataTask(with: url){(data,response, error)
                in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                  //  print(dataString!)
                    
                    if  let movie = self.parseJSON(movieData: safeData) {
                        //delegate?.didUpdateWeather(self, movie: movie)
                       // var stringMovie = String(movie)
                    //   print("Objeto parseado + \(movie)")
                    }
                }
            }
            
            //4. empezar la tarea
            task.resume()
        }
    }
    
    func parseJSON(movieData: Data) -> MovieModel? {
        let decoder = JSONDecoder()
        do{
            
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            
            let title = decodedData.title
            let year = decodedData.year
            let poster = decodedData.poster
            let duration = decodedData.duration
            let small_poster = decodedData.small_poster
            let description = decodedData.description
            
            
            let movie = MovieModel(title: title, year: year, poster: poster, duration: duration, small_poster: small_poster, description: description)
            print(movie.poster)
            return movie
            

        } catch {
            print(error)
            return nil
            }
        }
    
//    func parseToArrayJ (movieData: Data) -> [Any]?{
//        let decoder = JSONDecoder()
//        do{
//
//            let decodedData = try decoder.decode([T].self, from: movieData)
//
//            let title = decodedData.title
//            let year = decodedData.year
//            let poster = decodedData.poster
//            let duration = decodedData.duration
//            let small_poster = decodedData.small_poster
//            let description = decodedData.description
//
//
//            let movie = MovieModel(title: title, year: year, poster: poster, duration: duration, small_poster: small_poster, description: description)
//            return movie
//
//
//        } catch {
//            print(error)
//            return nil
//            }
//
//    }

    }


