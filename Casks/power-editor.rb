cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "6ce1e339d231242ee3b4087ae5450687e39d43e52e838875dc47c54a35735f1f",
         intel: "96d22208d353953fd92877e0dd9da9cd4f79f87db716ab3d074707e1578dc7a0"

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
