
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class BaseView: UIViewController {
    static var identifier : String {
        return String(describing: self)
    }


	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		initView()
        loadData()
	}
    
    // MARK: - Init View
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    func initView() {
        title = "Fitness App UIViews"

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Load data
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {
        names.append(HomeView.identifier)
        names.append(RunningView.identifier)
        names.append(CreateTrainingView.identifier)
        names.append(CaloriesView.identifier)
    }
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		switch names[indexPath.row] {
            
        case HomeView.identifier:
            let homeView = HomeView()
            let navController = NavigationController(rootViewController: homeView)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true)
            
        case RunningView.identifier:
            let runningView = RunningView()
            navigationController?.pushViewController(runningView, animated: true)
            
        case CreateTrainingView.identifier:
            let createTrainingView = CreateTrainingView()
            let navController = NavigationController(rootViewController: createTrainingView)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true)
            
        case CaloriesView.identifier:
            let caloriesView = CaloriesView()
            navigationController?.pushViewController(caloriesView, animated: true)

			default:
				break
		}
	}
}
