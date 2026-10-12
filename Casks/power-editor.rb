cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "c27aea62ffd96693ffa9f4e153a9fc17bfe6e575a2ca2258354af7c0c45e0c34",
         intel: "ff5d284e3cbc752a75ecf622a9f42599941fc9974aebabdc3b6751cb0d2630b7"

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
