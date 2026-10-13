cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "4b89474c951124287c200683c3727bca96ec6cc026808cfd88facccbc58f803e",
         intel: "e47aca35222f03ef4866563391aa7f1507d8e8e223727e297af94296d653ccb1"

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
