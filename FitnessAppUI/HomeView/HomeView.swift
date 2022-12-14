
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class HomeView: UIViewController {
    static var identifier : String {
        return String(describing: self)
    }

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView1: UICollectionView!
    @IBOutlet var collectionView2: UICollectionView!
    @IBOutlet var collectionView3: UICollectionView!
    @IBOutlet var layoutConstraintCollectionView3Height: NSLayoutConstraint!

    private var data1: [[String: String]] = []
    private var data2: [[String: String]] = []
    private var data3: [String] = []

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {

        super.viewDidLoad()
        initView()
        loadData()
        pageControl.numberOfPages = data1.count
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        if let navController = navigationController as? NavigationController {
            navController.setBackground(color: .clear)
        }
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
        if let navController = navigationController as? NavigationController {
            navController.setNavigationBar()
        }
    }
    
    // MARK: - Init View
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func initView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

        collectionView1.register(UINib(nibName: HomeCell1.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: HomeCell1.identifier)
        collectionView2.register(UINib(nibName: HomeCell2.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: HomeCell2.identifier)
        collectionView3.register(UINib(nibName: HomeCell3.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: HomeCell3.identifier)
        
    }

    // MARK: - Data methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {

        data1.removeAll()
        data2.removeAll()
        data3.removeAll()

        var dict1: [String: String] = [:]
        dict1["title"] = "The Essential Yoga Poses for Beginners"
        dict1["description"] = "These basic yoga poses for beginners are ideal if you're just dipping your toe into yoga flows."
        data1.append(dict1)

        var dict2: [String: String] = [:]
        dict2["title"] = "The Perfect Strength Training Workout for Beginners"
        dict2["description"] = "This total-body dumbbell routine is the easiest way to ease into strength training as a newbie."
        data1.append(dict2)

        var dict3: [String: String] = [:]
        dict3["title"] = "The Cindy CrossFit Workout Is 20 Minutes You Won't Soon Forget"
        dict3["description"] = "Nope, you don't need to be a CrossFit Games athlete to try the Cindy WOD."
        data1.append(dict3)

        var dict4: [String: String] = [:]
        dict4["title"] = "The Intense Ab Workout You'll Barely Make It Through"
        dict4["description"] = "No elementary moves here???this intense ab workout is the real deal"
        data1.append(dict4)

        var dict5: [String: String] = [:]
        dict5["title"] = "The 6 Exercises Kayla Itsines Recommends for Better Posture"
        dict5["description"] = "Whether you sit at a desk job all day or you're rebuilding strength after giving birth, Itsines says these moves are a great way to relieve tension in the body."
        data1.append(dict5)

        var dict6: [String: String] = [:]
        dict6["title"] = "Dumbbell rows"
        dict6["category"] = "Gym Training"
        data2.append(dict6)

        var dict7: [String: String] = [:]
        dict7["title"] = "Single-leg deadlifts"
        dict7["category"] = "Community"
        data2.append(dict7)

        var dict8: [String: String] = [:]
        dict8["title"] = "Side planks"
        dict8["category"] = "Gym Training"
        data2.append(dict8)

        var dict9: [String: String] = [:]
        dict9["title"] = "Glute bridge"
        dict9["category"] = "Community"
        data2.append(dict9)

        var dict10: [String: String] = [:]
        dict10["title"] = "Chair squat"
        dict10["category"] = "Community"
        data2.append(dict10)

        data3.append("")
        data3.append("")
        data3.append("")
        data3.append("")
        data3.append("")

        refreshCollectionView1()
        refreshCollectionView2()
        refreshCollectionView3()
    }

    // MARK: - Refresh methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshCollectionView1() {

        collectionView1.reloadData()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshCollectionView2() {

        collectionView2.reloadData()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshCollectionView3() {

        DispatchQueue.main.async {
            self.collectionView3.reloadData()
            self.layoutConstraintCollectionView3Height.constant = self.collectionView3.contentSize.height
        }
    }

    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @objc func actionMenu(_ sender: UIButton) {

        print(#function)
        dismiss(animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @objc func actionLearnMore(_ sender: UIButton) {

        print(#function)
        dismiss(animated: true)
    }
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeView: UICollectionViewDataSource {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if (collectionView == collectionView1) { return data1.count }
        if (collectionView == collectionView2) { return data2.count }
        if (collectionView == collectionView3) { return data3.count }
        return 0
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == collectionView1 {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell1.identifier, for: indexPath) as? HomeCell1 else {return UICollectionViewCell()}
            cell.bindData(index: indexPath, data: data1[indexPath.row])
            cell.buttonLearnMore.addTarget(self, action: #selector(actionLearnMore(_:)), for: .touchUpInside)
            
            return cell
        }

        else if collectionView == collectionView2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell2.identifier, for: indexPath) as! HomeCell2
            cell.bindData(index: indexPath, data: data2[indexPath.row])
            return cell
        }

        else if collectionView == collectionView3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell3.identifier, for: indexPath) as! HomeCell3
            cell.bindData(index: indexPath)
            return cell
        }
        
        else {
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeView: UICollectionViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(#function)
        switch collectionView {
        case collectionView1:
            print("collectionView1 clicked")
        case collectionView2:
            print("collectionView2 clicked")
        case collectionView3:
            print("collectionView3 clicked")
        default:
            print("default clicked")
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeView: UICollectionViewDelegateFlowLayout {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.size.width - 30
        let height = collectionView.frame.size.height - 20

        if (collectionView == collectionView1) { return collectionView.frame.size }
        if (collectionView == collectionView2) { return CGSize(width: 200, height: height)}
        if (collectionView == collectionView3) { return CGSize(width: width, height: width)}
        return CGSize.zero
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        if (collectionView == collectionView1) { return 0    }
        if (collectionView == collectionView2) { return 10    }
        if (collectionView == collectionView3) { return 15    }
        return 0
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        if (collectionView == collectionView1) { return 0    }
        if (collectionView == collectionView2) { return 10    }
        if (collectionView == collectionView3) { return 15    }
        return 0
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if (collectionView == collectionView1) { return UIEdgeInsets.zero }
        if (collectionView == collectionView2) { return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15) }
        if (collectionView == collectionView3) { return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15) }
        return UIEdgeInsets.zero
    }
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeView: UIScrollViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.tag == 11 {
            if let navController = navigationController as? NavigationController {
                if (scrollView.contentOffset.y > collectionView1.frame.size.height) {
                    navController.setBackground(color: .systemBackground)
                } else {
                    navController.setBackground(color: .clear)
                }
            }
        }
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        if (scrollView == collectionView1) {
            let visibleRect = CGRect(origin: collectionView1.contentOffset, size: collectionView1.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

            if let visibleIndexPath = collectionView1.indexPathForItem(at: visiblePoint) {
                pageControl.currentPage = visibleIndexPath.row
            }
        }
    }
}
