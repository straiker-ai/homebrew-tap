cask "ascend-tunnel" do
  version "0.1.2"

  on_arm do
    sha256 "0a8cab2a230620b9c74156ff769656f3f9305cf1aa4a91ddae0c3df113fffff8"

    url "https://github.com/straiker-ai/ascend-tunnel/releases/download/v#{version}/ascend-tunnel_#{version}_darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "1d627a7885a6a922e5d48883f85f43e6f5215cee3dd128b955e228c646ce1b76"

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
