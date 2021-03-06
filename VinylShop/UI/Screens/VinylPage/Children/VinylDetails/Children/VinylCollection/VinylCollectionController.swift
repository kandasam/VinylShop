import UIKit

class VinylCollectionController: UIViewController, UICollectionViewDataSource,
        UICollectionViewDelegateFlowLayout, VinylCollectionControllerProtocol {

    init(viewModel: VinylCollectionViewModel, presenter: VinylPresenter = VinylPresenter()) {
        self.viewModel = viewModel
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    var vinylsView: VinylCollectionView {
        return forceCast(view)
    }

    // MARK: - VinylCollectionControllerProtocol

    var vinylSelectedAction: ((Vinyl) -> Void)?

    func visibleCell(forVinylID vinylID: Int) -> VinylCollectionCell? {
        return vinylsView.collectionView
            .visibleCellsPaths(VinylCollectionCell.self)
            .first { viewModel.vinyl(at: $0.path).id == vinylID }
            .map { $0.cell }
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = VinylCollectionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
        setUpCollectionView()
    }

    // MARK: - UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.vinyls.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.cell(
            for: indexPath,
            modeling: viewModel.vinyl(at:),
            with: presenter.present(vinyl:in:)
        )
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vinyl = viewModel.vinyl(at: indexPath)
        vinylSelectedAction?(vinyl)
    }

    // MARK: - Private

    private let viewModel: VinylCollectionViewModel
    private let presenter: VinylPresenter

    private func setUpTitle() {
        vinylsView.titleLabel.text = viewModel.title.uppercased()
    }

    private func setUpCollectionView() {
        vinylsView.collectionView.dataSource = self
        vinylsView.collectionView.delegate = self
    }

    // MARK: - Required initializer

    required init?(coder _: NSCoder) { return nil }

}

private extension VinylCollectionViewModel {

    func vinyl(at indexPath: IndexPath) -> Vinyl {
        return vinyls[indexPath.row]
    }

}
