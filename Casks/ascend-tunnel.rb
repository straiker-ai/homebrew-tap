cask "ascend-tunnel" do
  version "0.1.4"

  on_arm do
    sha256 "9c59b61e8aa699997c84f870a54bc03d6cef45e0b9c947258d940405f3b21167"

    url "https://github.com/straiker-ai/ascend-tunnel/releases/download/v#{version}/ascend-tunnel_#{version}_darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "f8a9cb17d873730419db7d0fbc13cb74d42063082c318d52a3093d4ae7c01b00"

    url "https://github.com/straiker-ai/ascend-tunnel/releases/download/v#{version}/ascend-tunnel_#{version}_darwin_amd64.tar.gz"
  end

  name "ascend-tunnel"
  desc "Outbound-only tunnel agent for Straiker Ascend"
  homepage "https://github.com/straiker-ai/ascend-tunnel"

  binary "ascend-tunnel"

  # The binary isn't notarized yet. Without this, macOS blocks it on first run.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          ".",
        writable_paths: ["."],
        must_succeed:   false
  end
end
