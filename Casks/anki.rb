cask "anki" do
  arch arm: "apple", intel: "intel"

  version "2.1.65"

  on_catalina :or_older do
    sha256 "d39cb359228ed4e0166f26b64656003aa6c41bc86f009d2e6ea49bab13e1cdee"

    url "https://github.com/ankitects/anki/releases/download/#{version}/anki-#{version}-mac-#{arch}-qt5.dmg",
        verified: "github.com/ankitects/anki/"
  end
  on_big_sur :or_newer do
    sha256 arm:   "d68c1b78bdbc7673980fb9d1f6e66df441ef14aef91851917ba4bda15f39128a",
           intel: "ce6088efbc8b768266ff39d4832fb167c25defb17708f973ab771e0737240385"

    url "https://github.com/ankitects/anki/releases/download/#{version}/anki-#{version}-mac-#{arch}-qt6.dmg",
        verified: "github.com/ankitects/anki/"
  end

  name "Anki"
  desc "Memory training application"
  homepage "https://apps.ankiweb.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "anki-beta"
  depends_on macos: ">= :high_sierra"

  app "Anki.app"

  zap trash: "~/Library/Application Support/Anki*"
end
