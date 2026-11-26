class OhMyOpenshell < Formula
  desc "Terminal dashboard and portable config for NVIDIA OpenShell sandboxes"
  homepage "https://github.com/Guilospanck/oh-my-openshell"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-aarch64.tar.gz"
      sha256 "0280f3ea3a7c2b2819d8109545edaae87561279b7ceb0eb45c057c900f82228c"
    end
    on_intel do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-x86_64.tar.gz"
      sha256 "e4d76f778c09339495e8cde6d315c2faa0279077aa8dbf4659e856a6fe70bd0e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-aarch64.tar.gz"
      sha256 "098e4e267f557f6a1a831da1bc13e23b103009ac182f1e89b4a1c83b5c8b1fb1"
    end
    on_intel do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-x86_64.tar.gz"
      sha256 "41dd665c6dc298b26dd3b627c7ddbfa5c19fa705e622bf5b05d7405e5c9e1c74"
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
