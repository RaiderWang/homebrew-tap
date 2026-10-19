cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.7"
  sha256 arm:   "705ad873e3674af90a94ec80d15a81a7a72c1ee6efa639ffdea968d643a70195",
         intel: "03d9d09f159c16d3740fa0196af60940885767b8dcacb6975ec5b331ea52f1e3"

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
