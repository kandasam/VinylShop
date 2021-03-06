import Anchorage
import UIKit

class VinylDetailsFeaturesView: UIView {

    private let titleLabel: UILabel = UILabel(frame: .zero)
        |> font(.nunito(.extraBold), size: 12, color: .black000000)
        <> text("ALBUM FEATURES")

    private let firstLineContainer: UIStackView = UIStackView(frame: .zero)
        |> fillHorizontal(spacing: 32)
        <> alignBottoms

    private let secondLineContainer: UIStackView = UIStackView(frame: .zero)
        |> fillHorizontal(spacing: 32)
        <> alignBottoms

    private let recordsView: VinylDetailsLargeFeatureView =
        VinylDetailsLargeFeatureView(title: "1", subtitle: "Records")
    private let tracksView: VinylDetailsLargeFeatureView = VinylDetailsLargeFeatureView(title: "8", subtitle: "Tracks")
    private let genreView: VinylDetailsGenreView = VinylDetailsGenreView()
    private let typeView: VinylDetailsSmallFeatureView =
        VinylDetailsSmallFeatureView(title: "12″ / 180g", subtitle: "Type")
    private let releaseDateView: VinylDetailsSmallFeatureView =
        VinylDetailsSmallFeatureView(title: "15 JUN 2008", subtitle: "Release Date")

    init() {
        super.init(frame: .zero)

        setUpSelf()
        addSubviews()
        setUpLayout()
    }

    // MARK: - Configuration

    private func setUpSelf() {
        backgroundColor = Color.grayEEF2F5.ui()
    }

    // MARK: - Subviews

    private func addSubviews() {
        [titleLabel, firstLineContainer, secondLineContainer].forEach(addSubview)
        [recordsView, tracksView, genreView].forEach(firstLineContainer.addArrangedSubview)
        [typeView, releaseDateView].forEach(secondLineContainer.addArrangedSubview)
    }

    // MARK: - Layout

    private func setUpLayout() {
        titleLabel.topAnchor == topAnchor + 26
        titleLabel.leadingAnchor == leadingAnchor + 65

        firstLineContainer.topAnchor == titleLabel.bottomAnchor + 15
        firstLineContainer.leadingAnchor == titleLabel.leadingAnchor

        secondLineContainer.topAnchor == firstLineContainer.bottomAnchor + 15
        secondLineContainer.leadingAnchor == firstLineContainer.leadingAnchor
        secondLineContainer.bottomAnchor == bottomAnchor - 24
    }

    // MARK: - Required initializer

    required init?(coder _: NSCoder) { return nil }

}
