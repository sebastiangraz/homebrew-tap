class Videotools < Formula
  desc "Engine that runs videotools jobs on this machine"
  homepage "https://videotoo.ls"
  version "1.7"

  on_macos do
    on_arm do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.7/videotools-engine-darwin-arm64"
      sha256 "66901a3f67f0191bfea4141e84025448d394bca3deb2e18768a6f71c1b36e716"
    end
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.7/videotools-engine-darwin-x64"
      sha256 "bf1d8e8ee4b1a25b635c08c0f6e5c2ade773c64338f10d0087c05f49df931bea"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.7/videotools-engine-linux-x64"
      sha256 "7e3bdf48f140c2a9a9b1cf8f7f91daeccad443652273f66efceead00f962066d"
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
