class OhMyOpenshell < Formula
  desc "Terminal dashboard and portable config for NVIDIA OpenShell sandboxes"
  homepage "https://github.com/Guilospanck/oh-my-openshell"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-aarch64.tar.gz"
      sha256 "002d531dca5ce99c3c72c6a1a8e941d039c6290640d11e14f2783404c3a65ea1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-aarch64.tar.gz"
      sha256 "94ed8606b4b701448afe4f722e252ad66e5e425056e128dd0a67aebb08ceb451"
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
