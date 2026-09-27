cask "localfox" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/xergic/localfox/releases/download/v#{version}/Localfox-#{version}.dmg"
  name "Localfox"
  desc "Menu bar app that runs local dev servers behind HTTPS .localhost domains"
  homepage "https://github.com/xergic/localfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Localfox.app"

  uninstall launchctl: "net.kandera.localfox.helper",
            quit:      "net.kandera.localfox"

  zap trash: [
    "/Library/Application Support/Localfox",
    "~/Library/Application Support/Localfox",
    "~/Library/Preferences/net.kandera.localfox.plist",
  ]
end
