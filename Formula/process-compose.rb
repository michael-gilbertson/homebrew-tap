# frozen_string_literal: true

# Repackages Process Compose's release archives, as https://github.com/F1bonacc1/homebrew-tap
# does, so `brew install michael-gilbertson/tap/bonsai` needs no second tap.
# Keep it at or above the version bonsai requires (1.122.0).
class ProcessCompose < Formula
  desc "Scheduler and orchestrator of non-containerized processes"
  homepage "https://github.com/F1bonacc1/process-compose"
  version "1.124.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/F1bonacc1/process-compose/releases/download/v#{version}/process-compose_darwin_arm64.tar.gz"
      sha256 "818e29bdb75ec5c5e1fa9af64773964f513c8d0fe995c2e48328b4eaa1ea4789"
    end
    on_intel do
      url "https://github.com/F1bonacc1/process-compose/releases/download/v#{version}/process-compose_darwin_amd64.tar.gz"
      sha256 "45d5234095de27b23445041a56cce5e5f3a80d6b303fccbceba94db0cd13563d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/F1bonacc1/process-compose/releases/download/v#{version}/process-compose_linux_arm64.tar.gz"
      sha256 "98e02400a05d1da74a6506a4ffb2682b1205b18f02ecfbfdea1005f9389fc52d"
    end
    on_intel do
      url "https://github.com/F1bonacc1/process-compose/releases/download/v#{version}/process-compose_linux_amd64.tar.gz"
      sha256 "487ce011d5324b4578d3ec1860aaa1dd3a95bd4b2b433e03791f73a23d215fd3"
    end
  end

  def install
    bin.install "process-compose"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/process-compose version")
  end
end
