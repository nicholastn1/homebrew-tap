# Template for nicholastn1/homebrew-tap. release.sh fills in 0.5.0 and 463bbd05fef40e989937b2d27dacf6dd960c02d844f5779d1ecb0d848c2fefc7.
cask "cadence" do
  version "0.5.0"
  sha256 "463bbd05fef40e989937b2d27dacf6dd960c02d844f5779d1ecb0d848c2fefc7"

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
