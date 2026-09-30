cask "power-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "c7fe6a10481d45ffcb2c151b93254a3cd1b3f9eae6ce9a8686f1eee54065cbb0",
         intel: "7d096b274f4e5f13d865dc682f3a843989b1d9d0eff8f7f64189a044a89c4d84"

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
