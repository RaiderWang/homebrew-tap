cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "531af4a84ca31bf65d37fce873b0845fd81d067a8982771cac97fcaf4492464c",
         intel: "87c91e25e263a9b3dd0ab575e2a31ea9dbbe569adea760c4d72c4e345e02cd31"

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
