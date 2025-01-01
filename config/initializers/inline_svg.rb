require "inline_svg"

InlineSvg.configure do |config|
  config.asset_finder = InlineSvg::PropshaftAssetFinder
end
