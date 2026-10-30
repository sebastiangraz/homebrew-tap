class Videotools < Formula
  desc "Engine that runs videotools jobs on this machine"
  homepage "https://videotools-client.vercel.app"
  version "1.5"

  on_macos do
    on_arm do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.5/videotools-engine-darwin-arm64"
      sha256 "c5977c846439275ddeffd287e950f5c731a3f63a6ac5fb1b866cb5d204a1b983"
    end
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.5/videotools-engine-darwin-x64"
      sha256 "901aefbc7369c97f295b21589a6dd5bb51806ae10fc717b8f4d11e61e36959ed"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/sebastiangraz/videotools/releases/download/engine-v1.5/videotools-engine-linux-x64"
      sha256 "5c5833ec2a52efb83e92f3cbaaf33abc13b9368033d2791e2477b025dcf345e4"
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
