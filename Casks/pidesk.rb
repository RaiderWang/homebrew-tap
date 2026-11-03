cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.9"
  sha256 arm:   "ca09c8f74e9ccc753bdc8fd91e755283b0497c7c7f2fbf32e9b183b26ebe8d18",
         intel: "df851dcfaa8ed8cadf82c1cba92c51d34eb95273b1d7d11c132d7510e28dcd76"

  url "https://github.com/RaiderWang/pidesk/releases/download/v#{version}/PiDesk_#{version}_#{arch}.dmg"
  name "PiDesk"
  desc "GUI desktop companion for oh-my-pi (omp)"
  homepage "https://github.com/RaiderWang/pidesk"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PiDesk.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/PiDesk.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.raiderwang.pidesk",
    "~/Library/Caches/com.raiderwang.pidesk",
    "~/Library/Preferences/com.raiderwang.pidesk.plist",
    "~/Library/Saved Application State/com.raiderwang.pidesk.savedState",
  ]
end
