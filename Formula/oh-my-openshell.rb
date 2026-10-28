class OhMyOpenshell < Formula
  desc "Terminal dashboard and portable config for NVIDIA OpenShell sandboxes"
  homepage "https://github.com/Guilospanck/oh-my-openshell"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-darwin-aarch64.tar.gz"
      sha256 "67e5fab08736d7b4cfbedef1d7bf6f28dd0b69321446a6720a0bb3e44f1a37fa"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/oh-my-openshell/releases/download/v#{version}/osh-v#{version}-linux-aarch64.tar.gz"
      sha256 "7811d164fc997819deee0ba23d76616ac5f91a481e4dc28d9c57af8be32e465a"
    end
  end

  def install
    bin.install "osh"
  end

  def caveats
    <<~EOS
      Installing osh does not install OpenShell, a container runtime or a gateway.
      Run `osh setup` when you want those (it asks before each step).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/osh --version")
  end
end
