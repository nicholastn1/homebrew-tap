# Template for nicholastn1/homebrew-tap. release.sh fills in 0.5.4 and 91e0c3fea4d5a5360375fe237a599a9ae50a4ad3c2efdffeea81e7cb9eb4362c.
cask "cadence" do
  version "0.5.4"
  sha256 "91e0c3fea4d5a5360375fe237a599a9ae50a4ad3c2efdffeea81e7cb9eb4362c"

  url "https://github.com/nicholastn1/cadence/releases/download/v#{version}/Cadence-#{version}.zip"
  name "Cadence"
  desc "Teleprompter in the MacBook notch that scrolls at the pace you speak"
  homepage "https://github.com/nicholastn1/cadence"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Cadence.app"

  # Not notarized yet: drop the quarantine flag so Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Cadence.app"]
  end

  zap trash: "~/Library/Preferences/io.github.nicholastn1.cadence.plist"
end
