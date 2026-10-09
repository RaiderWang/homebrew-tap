cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "2531f7a211b13600e88c9eea2886cb1f9a1d30f84e4c5bc0abeb7cc49ebc9d5f",
         intel: "fbce3b461124aa890fc5caa8bad5c2efa196c5a8668baa1ff9b8be7525b6d78b"

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
