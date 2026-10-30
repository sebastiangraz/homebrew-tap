class Videotools < Formula
  desc "Engine that runs videotools jobs on this machine"
  homepage "https://videotools-client.vercel.app"
  version "1.4"

  on_macos do
    on_arm do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.4/videotools-engine-darwin-arm64"
      sha256 "8c565165973b305444afdfc0d35386edddef0b8abfe44cdb25979714943401f3"
    end
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.4/videotools-engine-darwin-x64"
      sha256 "37acf630fb448a4992cb9854e0cddad2d6ce77c7e1baa48f6377e7213f720f39"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.4/videotools-engine-linux-x64"
      sha256 "2ab05492c9eb4620ba3d637679d7e7a5c0e66ef55a20215bd1511f738c276704"
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
