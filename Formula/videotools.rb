class Videotools < Formula
  desc "Engine that runs videotools jobs on this machine"
  homepage "https://videotools-client.vercel.app"
  version "1.6"

  on_macos do
    on_arm do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.6/videotools-engine-darwin-arm64"
      sha256 "7c4bcdc64cbb51a42c983452d31c304519a3319a1f606fa1fef4b6b8e145813f"
    end
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.6/videotools-engine-darwin-x64"
      sha256 "6aee0b724a6d3c60f28dc87bf1de82a267495824e1000008cc574b0deb7f0aff"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.6/videotools-engine-linux-x64"
      sha256 "7137b08b5e155e3c8b9ad7596251a540cfd43f622a9fa925d81f193169d7b04e"
    end
  end

  def install
    libexec.install Dir["videotools-engine-*"].first => "videotools-engine"
    chmod 0755, libexec/"videotools-engine"
  end

  service do
    run opt_libexec/"videotools-engine"
    keep_alive true
    log_path var/"log/videotools.log"
    error_log_path var/"log/videotools.log"
  end
end
