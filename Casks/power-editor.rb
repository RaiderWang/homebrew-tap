cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "639a35dd50b294711f1af07cf637fbf5e0db114ba502c16d1290e72adfde4e00",
         intel: "e09e257a214a24b454075e327f0d525f1161087c5ebc95faf925913ea1b349aa"

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
