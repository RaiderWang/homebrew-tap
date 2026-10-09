cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "e30c78dcc2163b0ab10fa3897622f3fc457a3491f1ed45753d2a4f11ca19bfba",
         intel: "aab7f0b55b3e3de3fd3d275f0d1a3a1f1a3406e0f018a51600cb86a94c2db241"

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
