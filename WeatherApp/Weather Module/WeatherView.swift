//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class WeatherView: UIViewController {
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentSkyconContainerView: UIView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var horizontalStackView: UIStackView! {
        didSet {
            horizontalStackView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var topTrailingButton: UIButton! {
        didSet {
            topTrailingButton.setImage(UIImage(imageLiteralResourceName: "map"), for: .normal)
            topTrailingButton.imageView?.contentMode = .scaleAspectFit
            topTrailingButton.tintColor = .orange
        }
    }
    @IBOutlet weak var topLeadingButton: UIButton! {
        didSet {
            topLeadingButton.setImage(UIImage(imageLiteralResourceName: "heart"), for: .normal)
            topLeadingButton.imageView?.contentMode = .scaleAspectFit
            topLeadingButton.tintColor = .red
        }
    }

    var presenter: WeatherPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        view.subviews.forEach { $0.alpha = 0.0 }

        detailsTableView.delegate = presenter
        detailsTableView.dataSource = presenter
        detailsTableView.backgroundColor = .clear
        detailsTableView.separatorStyle = .none


        todaysDateLabel.text = "Today's Date"
        todaysDateLabel.textColor = .lightText

        currentDateLabel.textColor = .white
        currentSkyconContainerView.backgroundColor = .clear
        currentDateLabel.font = UIFont.systemFont(ofSize: 45, weight: UIFont.Weight.bold)


        currentSummaryLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        currentSummaryLabel.textColor = .white
        currentSummaryLabel.numberOfLines = 0

        currentTemperatureLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        currentTemperatureLabel.textColor = .white

        cityStateLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        cityStateLabel.textColor = .white

        view.backgroundColor = UIColor(displayP3Red: 20/256.0, green: 27/256.0, blue: 36/256.0, alpha: 1.0)

        presenter.didLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


    @IBAction func topTrailingButtonPressed(_ sender: Any) {
        presenter.mapsButtonPressed()
    }

    @IBAction func topLeadingButtonPressed(_ sender: Any) {
        print("show favorites")
    }

    func animateViews() {
        UIView.animate(withDuration: 1.25) {
            self.view.subviews.forEach { $0.alpha = 1.0 }
        }
    }

    func update(weatherData: WeatherData?) {
        guard let weatherData = weatherData, horizontalStackView.arrangedSubviews.isEmpty else {
            return
        }

        detailsTableView.reloadData()
        currentSummaryLabel.text = weatherData.currently.summary
        currentTemperatureLabel.text = "\(Int(weatherData.currently.temperature))℉"

        if let icon = weatherData.currently.icon {
            let iconView = SKYIconView(frame: currentSkyconContainerView.bounds)
            iconView.setType = icon
            iconView.setColor = icon.color
            iconView.backgroundColor = .clear
            currentSkyconContainerView.addSubview(iconView)
        }

        for (index, day) in weatherData.daily.days.enumerated() {
            let view: ForcastView = ForcastView.fromNib()
            view.backgroundColor = .clear
            horizontalStackView.addArrangedSubview(view)

            let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"

            if let icon = day.icon {
                view.iconView.setType = icon
                view.iconView.setColor = icon.color
                view.iconView.backgroundColor = .clear
                view.iconView.play()
            }

            view.topLabel.text = "\(Int(day.temperatureHigh))℉"
            view.bottomLabel.text = "\(Int(day.temperatureLow))℉"
            view.headerLabel.text = dateFormatter.string(from: date!)
        }

        animateViews()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension WeatherView: WeatherUserInterface {

    func configure(viewModel: WeatherViewModel) {
        update(weatherData: viewModel.weatherData)
        cityStateLabel.text = "\(viewModel.city ?? ""), \(viewModel.state ?? "")"
        currentDateLabel.text = viewModel.dateString
    }

}

class WeatherStoryboard {
    private static let storyboard = UIStoryboard(name: "WeatherStoryboard", bundle: Bundle(for: WeatherStoryboard.self))

    static var viewController: WeatherView {
        return storyboard.viewController("WeatherView")
    }
}

public extension UIStoryboard {

    func viewController<ViewController: UIViewController>(_ identifier: String) -> ViewController {
        guard let controller = instantiateViewController(withIdentifier: identifier) as? ViewController else { fatalError("The storyboard has no \(identifier)") }
        return controller
    }

}
