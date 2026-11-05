class OhMyOpenshell < Formula
  desc "Terminal dashboard and portable config for NVIDIA OpenShell sandboxes"
  homepage "https://github.com/Guilospanck/oh-my-openshell"
  version "0.3.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-aarch64.tar.gz"
      sha256 "50de58fbcfaec1bc0a89173e76e20e6e7ff4b974fb830eb9772ede957dd31101"
    end
    on_intel do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-x86_64.tar.gz"
      sha256 "a0063067924d69c0752be43d20d430a0d6f6fdf16e86e466da23fe6de2ad49c7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-aarch64.tar.gz"
      sha256 "0a7782ac371e595e1f3c177ec9886c69ded8b40ec4368c5da8d65d57b7d79078"
    end
    on_intel do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-x86_64.tar.gz"
      sha256 "e0191444af6634945b46c3514443b8161c2039c6909d05dbab0cdec3fbf47dfb"
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
