cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "5f2b5a2e8e8c4823b3c15d251d9b6abf838f9c1c51aa1f6fc790fbb2653780e6",
         intel: "c4f4e4536c231f489cfd5b01b246fea6454d59204faf88c8ca2337969c931125"

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
