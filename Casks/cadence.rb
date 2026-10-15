# Template for nicholastn1/homebrew-tap. release.sh fills in 0.6.0 and c5c001a0555c47f34df201edd929a0327f925882c8185abdbd78a901eed11fdc.
cask "cadence" do
  version "0.6.0"
  sha256 "c5c001a0555c47f34df201edd929a0327f925882c8185abdbd78a901eed11fdc"

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
