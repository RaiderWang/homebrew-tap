cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.8"
  sha256 arm:   "7f5ef0712dd4fe64363d016c053c982a4a07d7c9aa8d552d8741dc57854c62f3",
         intel: "f43408ab780b9517b9b3e0192229cfb1081ef20f1c22ab3c2d2f68e0f85a2c31"

  url "https://github.com/RaiderWang/power-editor/releases/download/v#{version}/Power.Editor_#{version}_#{arch}.dmg"
  name "Power Editor"
  desc "High-performance text editor optimized for large files"
  homepage "https://github.com/RaiderWang/power-editor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Power Editor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Power Editor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.rickeditor.powereditor",
    "~/Library/Caches/com.rickeditor.powereditor",
    "~/Library/Preferences/com.rickeditor.powereditor.plist",
    "~/Library/Saved Application State/com.rickeditor.powereditor.savedState",
  ]
end
