cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.10"
  sha256 arm:   "4478b12094c2982efc0b1f3ced42e52d20bf62c2228356b4c7d1b96f1873fc16",
         intel: "3cb7b5858d25c508985a49adde2c86fbf51008c5fd940b0b9fd3292a324b3cab"

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
