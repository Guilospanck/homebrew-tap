class OhMyOpenshell < Formula
  desc "Terminal dashboard and portable config for NVIDIA OpenShell sandboxes"
  homepage "https://github.com/Guilospanck/oh-my-openshell"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-aarch64.tar.gz"
      sha256 "f2a1a74508d1c71eeb018b6fc51c976b954fa0f79e6251f6081dd00b8ec74d1d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-aarch64.tar.gz"
      sha256 "1a8939f7dbe8836585a98e4bc2d93e8d0fdbd263c8d00424dda8a40251c8c753"
    end
  end

  def install
    bin.install "osh"
  end

  def caveats
    <<~EOS
      Installing osh does not install OpenShell, a container runtime or a gateway.
      Run `osh setup` when you want those (it asks before each step).

      To remove everything, run `osh uninstall` before `brew uninstall`: Homebrew
      cannot clean up OpenShell, its gateways or osh's data folder.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/osh --version")
  end
end
