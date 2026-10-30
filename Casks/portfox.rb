cask "portfox" do
  version "1.6.1"
  sha256 "0ffcbc11f2839de9dc4324a79b594948245ad483b1fc2c5ba29034e7ea1e54c9"

  url "https://github.com/xergic/portfox/releases/download/v#{version}/Portfox-#{version}.dmg"
  name "Portfox"
  desc "Menu bar app that lists local dev servers and stops them"
  homepage "https://github.com/xergic/portfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Portfox.app"

  uninstall quit: "net.kandera.Portfox"

  zap trash: [
    "~/Library/Caches/net.kandera.Portfox",
    "~/Library/HTTPStorages/net.kandera.Portfox",
    "~/Library/Preferences/net.kandera.Portfox.plist",
  ]
end
