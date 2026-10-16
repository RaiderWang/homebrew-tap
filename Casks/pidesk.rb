cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "71a4fcb21624c29c58ee13eafb92ef808c0ed251a5d26b1a4c8e525a09cf7aa7",
         intel: "9d467976a33da100b51d19ba68e3545d8aad99c9cb335dc0ff0506b5256a3214"

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
