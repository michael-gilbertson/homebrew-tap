# frozen_string_literal: true

# Homebrew formula for bonsai: the prebuilt executables from each GitHub release.
# Bump `version` and the four sha256 values after each bonsai release.
class Bonsai < Formula
  desc "Run a copy of your app on every branch, with no port collisions"
  homepage "https://michael-gilbertson.github.io/bonsai/"
  version "0.39.1"
  license "MIT"

  # bonsai up supervises services with Process Compose, bonsai pr talks to GitHub
  # through gh, and per-branch HTTPS URLs are served by Caddy.
  depends_on "caddy"
  depends_on "gh"
  depends_on "michael-gilbertson/tap/process-compose"

  on_macos do
    on_arm do
      url "https://github.com/michael-gilbertson/bonsai/releases/download/v#{version}/bonsai-darwin-arm64"
      sha256 "17bad95389ab3513b47a2b503c979a79721d3302deecaff9b44e2ff8776ee0ba"
    end
    on_intel do
      url "https://github.com/michael-gilbertson/bonsai/releases/download/v#{version}/bonsai-darwin-x64"
      sha256 "9cdf2e82486cb1e0cf86c2f5f78fc2ee112e1faf6687b8e087d1c98d4adefd72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-gilbertson/bonsai/releases/download/v#{version}/bonsai-linux-arm64"
      sha256 "6e84a1fc192ba6a91757c1de303c82104e6913b7df7d815d87beb208c91b47ad"
    end
    on_intel do
      url "https://github.com/michael-gilbertson/bonsai/releases/download/v#{version}/bonsai-linux-x64"
      sha256 "0071722098cda1d1b463409e30e007bec9d20c524098d910141b8e8b7f9a436e"
    end
  end

  def install
    bin.install Dir["bonsai-*"].first => "bonsai"
  end

  def caveats
    <<~EOS
      To let `bonsai switch` and `bonsai add --follow` change your shell's directory:
        bonsai shell-init --install

      To check your setup:
        bonsai doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bonsai --version")
  end
end
