cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "7cbe34086b27d50994a32c28480a9c39408461c70adad7e69f12a76ab37a1810",
         intel: "02857a221eaf1a80978a982d9351313db64532a564b712d0c3b7750d125b43fe"

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
