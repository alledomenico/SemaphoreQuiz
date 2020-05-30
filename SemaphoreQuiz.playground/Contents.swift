//Semaphore quiz for Playground
//2020 Domenico Allegra

import UIKit
import PlaygroundSupport

public var count:Int = 1
public var wrong:[String] = []
public var correct:[String] = []

class BoardingController: UIViewController {
    
    override func viewDidLoad() {
        
        
        view.backgroundColor = #colorLiteral(red: 0.622666657, green: 0.4785016775, blue: 0.9234506488, alpha: 1)
        
        let logo = UIImageView()
        logo.frame = CGRect(x: 0, y: 40, width: 200, height: 200)
        logo.center.x = view.center.x
        logo.image = UIImage(named:"semaphoreLogo")
        view.addSubview(logo)
        
        
        let welcomeText = UILabel()
        welcomeText.text = "Semaphore Quiz" as String
        welcomeText.textColor = .white
        welcomeText.textAlignment = .center
        welcomeText.font = .systemFont(ofSize: 30, weight: .bold)
        welcomeText.frame = CGRect(x: 0.0, y: 0, width: 250, height: 40)
        welcomeText.center.x = view.center.x
        welcomeText.center.y = view.center.y-50
        view.addSubview(welcomeText)
        
        
        let textBody = UILabel()
        textBody.numberOfLines = 0
        textBody.text = "Check your semaphore knowledge and also learn along the way!" as String
        textBody.textAlignment = .center
        textBody.textColor = .black
        textBody.font = .systemFont(ofSize: 18, weight: .regular)
        textBody.frame = CGRect(x: 20.0, y: 350, width: 335, height: 80)
        view.addSubview(textBody)
        
        
        let nextButton = UIButton(frame: CGRect(x: 0, y: 570, width: 250, height: 44))
        nextButton.center.x = view.center.x
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        nextButton.setTitleColor(#colorLiteral(red: 0.371607244, green: 0.1776334345, blue: 0.01337992772, alpha: 1), for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.8984805942, green: 0.6318879724, blue: 0.1779083908, alpha: 1)
        nextButton.layer.cornerRadius = 10
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(bringItOn), for: .touchUpInside)
    }
    
    
    @objc func bringItOn (){
        
        print ("Button pressed")
        PlaygroundPage.current.liveView = GamePageController()
        
        
    }
    
}

PlaygroundPage.current.liveView = BoardingController()


//MARK:Semaphore game View Controller.

class GamePageController: UIViewController {
    
    let semaphoreIndex:[String] = ["A", "B", "C", "D", "E", "F", "G", "H","I", "J", "K", "L", "M", "N", "O", "P","Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var semaphoreImage:String = ""
    var topLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.7718935609, green: 0.7285760045, blue: 0.9921868443, alpha: 1)
        setupUI()
        
    }
    

    @objc func determineTF (sender: UIButton) {
        
        let answer = sender.currentTitle!
        
            for views in self.view.subviews {
                if views is UIButton {
                    views.removeFromSuperview()
                }
            }
        
        
        
        
        if answer == semaphoreImage {
            print ("Correct!")
            topLabel.text = "Correct!"
            correct.append(semaphoreImage)
            
             let correctAns = UILabel()
                        correctAns.frame = CGRect(x: 0, y: 130, width: 80, height: 80)
                        correctAns.center.x = view.center.x
                        correctAns.text = semaphoreImage
                        correctAns.textColor = .white
                        correctAns.font = .systemFont(ofSize: 30, weight: .heavy)
                        correctAns.textAlignment = .center
                        correctAns.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                        view.addSubview(correctAns)
            
        }
        else {
            print ("Wrong answer!")
            topLabel.text = "Wrong answer 😖"
            wrong.append(semaphoreImage)
            
            let correctAns = UILabel()
            correctAns.frame = CGRect(x: 0, y: 130, width: 80, height: 80)
            correctAns.layer.cornerRadius = 10
            correctAns.layer.masksToBounds = true
            correctAns.center.x = view.center.x
            correctAns.text = semaphoreImage
            correctAns.textColor = .white
            correctAns.font = .systemFont(ofSize: 30, weight: .heavy)
            correctAns.textAlignment = .center
            correctAns.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            view.addSubview(correctAns)
            
        }
        
    
        var nextButtonTitle:String = "Next"
        if count == 10 {
            nextButtonTitle = "View Results"
        }
        
        let nextButton = UIButton()
        nextButton.setTitle(nextButtonTitle, for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.frame = CGRect(x: 107, y: 510, width: 160, height: 40)
        nextButton.backgroundColor = #colorLiteral(red: 0.9056712389, green: 0.5757389665, blue: 0, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        view.addSubview(nextButton)
        
    }
    
    @objc func nextButtonPressed (){
        
        if count == 10 {
         
         for view in self.view.subviews {
         view.removeFromSuperview()
            }
        PlaygroundPage.current.liveView = ResultsController()
        }
            else {
                if count < 10 {
                    count += 1
                }
                for view in self.view.subviews {
                view.removeFromSuperview()
            }
            setupUI()
        }
    }
    
}

//MARK: UI Setup for the semaphore game page is here.

extension GamePageController {
    
    func setupUI(){
        
        let topFrame = UIView()
         topFrame.frame = CGRect(x: 0, y: 0, width: Int(view.frame.maxX), height: 120)
         topFrame.backgroundColor = #colorLiteral(red: 0.5549300313, green: 0.3536483049, blue: 0.9665967822, alpha: 1)
         view.addSubview(topFrame)
                
         
         let progressValue = UILabel()
         progressValue.text = "\(count) / 10"
         progressValue.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
         progressValue.backgroundColor = #colorLiteral(red: 0.9056712389, green: 0.5757389665, blue: 0, alpha: 1)
         progressValue.layer.cornerRadius = 10
         progressValue.layer.masksToBounds = true
         progressValue.center.x = view.center.x
         progressValue.center.y = topFrame.center.y+20
         progressValue.textAlignment = .center
         progressValue.font = .systemFont(ofSize: 15, weight: .bold)
         progressValue.textColor = .black
         view.addSubview(progressValue)
         
        
         
         topLabel.text = "Select your answer"
         topLabel.font = .systemFont(ofSize: 32, weight: .bold)
         topLabel.textColor = .white
         topLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 60)
         topLabel.center.x = view.center.x
         topLabel.center.y = topFrame.center.y/2
         topLabel.textAlignment = .center
         view.addSubview(topLabel)
         
         let bottomFrame = UIView()
         bottomFrame.frame = CGRect(x: 0, y: Int(view.frame.maxY-180), width: Int(view.frame.maxX), height: 180)
         bottomFrame.backgroundColor = #colorLiteral(red: 0.5549300313, green: 0.3536483049, blue: 0.9665967822, alpha: 1)
         view.addSubview(bottomFrame)
         
         
         let answer1 = semaphoreIndex.randomElement()!
         var answer2 = semaphoreIndex.randomElement()!
         var answer3 = semaphoreIndex.randomElement()!
         var answer4 = semaphoreIndex.randomElement()!
         
         
         while answer2 == answer1 {
             answer2 = semaphoreIndex.randomElement()!
         }
         
         while answer3 == answer1 || answer3 == answer2 {
             answer3 = semaphoreIndex.randomElement()!
         }
         
         while answer4 == answer1 || answer4 == answer2 || answer4 == answer3 {
             answer4 = semaphoreIndex.randomElement()!
         }
         
         let options:[String] = [answer1,answer2,answer3,answer4]
         print (options)
         
         
         let problem = options.randomElement()!
         semaphoreImage = problem
         let problemImage = UIImage(named: problem)
         let image = UIImageView()
         image.frame = CGRect(x: 0, y: 0,width: 300, height: 300)
         image.center = view.center
         image.image = problemImage
         view.addSubview(image)
         
         
         let button1 = UIButton()
         button1.setTitle(answer1, for: .normal)
         button1.setTitleColor(.black, for: .normal)
         button1.frame = CGRect(x: 13, y: 570, width: 80, height: 80)
         button1.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
         button1.layer.cornerRadius = 10
         button1.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
         button1.addTarget(self, action: #selector(determineTF), for: .touchUpInside)
         view.addSubview(button1)
         
         let button2 = UIButton()
         button2.setTitle(answer2, for: .normal)
         button2.setTitleColor(.black, for: .normal)
         button2.frame = CGRect(x: 103, y: 570, width: 80, height: 80)
         button2.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
         button2.layer.cornerRadius = 10
         button2.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
         button2.addTarget(self, action: #selector(determineTF), for: .touchUpInside)
         view.addSubview(button2)
         
         let button3 = UIButton()
         button3.setTitle(answer3, for: .normal)
         button3.setTitleColor(.black, for: .normal)
         button3.frame = CGRect(x: 193, y: 570, width: 80, height: 80)
         button3.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
         button3.layer.cornerRadius = 10
         button3.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
         button3.addTarget(self, action: #selector(determineTF), for: .touchUpInside)
         view.addSubview(button3)

         let button4 = UIButton()
         button4.setTitle(answer4, for: .normal)
         button4.setTitleColor(.black, for: .normal)
         button4.frame = CGRect(x: 283, y: 570, width: 80, height: 80)
         button4.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
         button4.layer.cornerRadius = 10
         button4.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
         button4.addTarget(self, action: #selector(determineTF), for: .touchUpInside)
         view.addSubview(button4)
        
    
         
    }
}

//MARK: Results VC.

class ResultsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.622666657, green: 0.4785016775, blue: 0.9234506488, alpha: 1)
        
        let headingText = UILabel()
        headingText.text = "Results" as String
        headingText.textColor = .white
        headingText.textAlignment = .center
        headingText.font = .systemFont(ofSize: 30, weight: .bold)
        headingText.frame = CGRect(x: 0.0, y: 0, width: 250, height: 40)
        headingText.center.x = view.center.x
        headingText.center.y = view.center.y-250
        view.addSubview(headingText)
        
        let correctLetters = correct.removingDuplicates()
        let wrongLetters = wrong.removingDuplicates()
        
        var string: String = ""
        for element in correctLetters {
            if string == "" {
                string = element
            } else {
            string = string + ", " + element
            }
        }
        
        var string1: String = ""
        for element1 in wrongLetters {
            if string1 == "" {
                string1 = element1
            } else {
            string1 = string1 + ", " + element1
            }
        }
        
        let correctLabel = UILabel()
        correctLabel.text = "\(correct.count)/10 Correct \n\(string)" as String
        correctLabel.textColor = .white
        correctLabel.textAlignment = .center
        correctLabel.font = .systemFont(ofSize: 25, weight: .bold)
        correctLabel.numberOfLines = 0
        correctLabel.frame = CGRect(x: 0.0, y: 0, width: 300, height: 140)
        correctLabel.layer.cornerRadius = 10
        correctLabel.layer.masksToBounds = true
        correctLabel.backgroundColor = #colorLiteral(red: 0.4587117434, green: 0.7679709792, blue: 0.2755523324, alpha: 1)
        correctLabel.center.x = view.center.x
        correctLabel.center.y = view.center.y-110
        view.addSubview(correctLabel)
        
        let wrongLabel = UILabel()
        wrongLabel.text = "\(wrong.count)/10  Wrong\n\(string1)" as String
        wrongLabel.textColor = .white
        wrongLabel.textAlignment = .center
        wrongLabel.numberOfLines = 0
        wrongLabel.font = .systemFont(ofSize: 25, weight: .bold)
        wrongLabel.frame = CGRect(x: 0.0, y: 0, width: 300, height: 140)
        wrongLabel.layer.cornerRadius = 10
        wrongLabel.layer.masksToBounds = true
        wrongLabel.backgroundColor = #colorLiteral(red: 0.6492866278, green: 0, blue: 0.2652121186, alpha: 1)
        wrongLabel.center.x = view.center.x
        wrongLabel.center.y = view.center.y+50
        view.addSubview(wrongLabel)
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 570, width: 300, height: 44))
        backButton.center.x = view.center.x
        backButton.setTitle("Back to Menu", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        backButton.setTitleColor(#colorLiteral(red: 0.371607244, green: 0.1776334345, blue: 0.01337992772, alpha: 1), for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.8984805942, green: 0.6318879724, blue: 0.1779083908, alpha: 1)
        backButton.layer.cornerRadius = 10
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
        
        
    }
    
    @objc func goToMenu (){
        count = 1
        wrong = []
        correct = []

        PlaygroundPage.current.liveView = BoardingController()
    }
    
}

//MARK: Extension for custom array feature.

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
