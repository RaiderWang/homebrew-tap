cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "b945637c4dd6de3b1c0a79f40631ebe2c987b148aa7de40e3edcc05aff54d2d4",
         intel: "d0f764d67cd3faa86255770508bdc40c51d069988e6ec770cdfd61e19ab66734"

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
