import Anchorage
import UIKit

class GenresView: UIView {

    let titleLabel: UILabel = UILabel(frame: .zero)
        |> font(.nunito(.extraBold), size: 12, color: .black000000)
        <> text("GENRES")

    private let allButton: UIButton = UIButton(frame: .zero)
        |> title("ALL", font: .nunito(.extraBold), size: 12, color: .blue2FC5D8)

    let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        |> horizontal
        <> layoutSpacing(item: 0, line: 16)
        <> { $0.sectionInset = UIEdgeInsets(top: 0.0, left: 65.0, bottom: 0.0, right: 50.0) }

    lazy var collectionView: UICollectionView =
        UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            |> background(color: .whiteFFFFFF)
            <> register(GenreCell.self)
            <> disableScrollIndicators

    init() {
        super.init(frame: .zero)

        addSubviews()
        setUpLayout()
    }

    // MARK: - Subviews

    private func addSubviews() {
        [titleLabel, allButton, collectionView].forEach(addSubview)
    }

    // MARK: - Layout

    private func setUpLayout() {
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        allButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        titleLabel.topAnchor == topAnchor + 30
        titleLabel.leadingAnchor == leadingAnchor + 65

        allButton.leadingAnchor == titleLabel.trailingAnchor + 16
        allButton.centerYAnchor == titleLabel.centerYAnchor
        allButton.trailingAnchor == trailingAnchor - 23

        collectionView.topAnchor == titleLabel.bottomAnchor + 22
        collectionView.leadingAnchor == leadingAnchor
        collectionView.trailingAnchor == trailingAnchor
        collectionView.bottomAnchor == bottomAnchor - 30
        collectionView.heightAnchor == 110
    }

    // MARK: - Required initializer

    required init?(coder _: NSCoder) { return nil }

}
