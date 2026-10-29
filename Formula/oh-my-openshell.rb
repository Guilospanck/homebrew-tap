class OhMyOpenshell < Formula
  desc "Terminal dashboard and portable config for NVIDIA OpenShell sandboxes"
  homepage "https://github.com/Guilospanck/oh-my-openshell"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-aarch64.tar.gz"
      sha256 "1e43c0d81fa8de005c0c2571ce0e98a6c671972a529099473a3e4a2b06af334d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-aarch64.tar.gz"
      sha256 "eff7464035888ca91fc8a6b3e9a871ac97426f113002482007e21db2bcb1fc4d"
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
