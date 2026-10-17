cask "pidesk" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.5"
  sha256 arm:   "48e4282b28311e519ffad074e1e8e6d6f6213de03549175bd64d252c06d5ac47",
         intel: "1a4eb460a411b1396b0d0b13c01c7db9bac9c454605770041c8243728b96c26e"

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
