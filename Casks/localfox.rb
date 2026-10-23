cask "localfox" do
  version "1.4.0"
  sha256 "86c7429e76ceb2759e39321f52a0fd72a94dcceaaa7d961d0c296124d5929d12"

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

  uninstall launchctl: "net.kandera.Localfox.helper",
            quit:      "net.kandera.Localfox"

  # The root CA is trusted in the login keychain. Only zap removes it, because
  # brew upgrade runs uninstall and a re-trust asks for a password.
  zap script: {
        executable: "/bin/sh",
        args:       [
          "-c",
          "security find-certificate -a -c 'Localfox Local Authority' -Z \"$1\" " \
          "| awk '/^SHA-256 hash:/ {print $3}' " \
          "| while read -r hash; do security delete-certificate -t -Z \"$hash\" \"$1\"; done",
          "sh",
          "#{Dir.home}/Library/Keychains/login.keychain-db",
        ],
      },
      trash:  [
        "/Library/Application Support/Localfox",
        "~/Library/Application Support/Localfox",
        "~/Library/Preferences/net.kandera.Localfox.plist",
      ]
end
