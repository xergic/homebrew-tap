cask "portfox" do
  version "1.3.0"
  sha256 "b0bc0b6e7ecc77fab9749ac7b6afab74efaa3f825a924b0264c1efbb7b852d77"

  url "https://github.com/xergic/portfox/releases/download/v#{version}/Portfox-#{version}.dmg"
  name "Portfox"
  desc "Menu bar app that lists local dev servers and stops them"
  homepage "https://github.com/xergic/portfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Portfox.app"

  uninstall quit: "net.kandera.Portfox"

  zap trash: "~/Library/Preferences/net.kandera.Portfox.plist"
end
