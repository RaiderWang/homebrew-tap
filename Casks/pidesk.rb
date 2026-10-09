cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "2c89afc96ba6a2141848b69fb88675f4478b5d05fe8be2a8fa37f98b376c16d6",
         intel: "c15a5bc0a57e92905f3b7c21820527414854221ca3ec4fbd77d4997ddda68046"

  url "https://github.com/RaiderWang/pidesk/releases/download/v#{version}/PiDesk_#{version}_#{arch}.dmg"
  name "PiDesk"
  desc "GUI desktop companion for oh-my-pi (omp)"
  homepage "https://github.com/RaiderWang/pidesk"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "PiDesk.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/PiDesk.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.raiderwang.pidesk",
    "~/Library/Caches/com.raiderwang.pidesk",
    "~/Library/Preferences/com.raiderwang.pidesk.plist",
    "~/Library/Saved Application State/com.raiderwang.pidesk.savedState",
  ]
end
