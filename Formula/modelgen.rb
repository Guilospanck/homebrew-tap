class Modelgen < Formula
  desc "Generate 3D models (GLB, USDZ) from a CLI or an MCP server"
  homepage "https://github.com/Guilospanck/modelgen"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.2.1/modelgen-0.2.1-darwin-arm64.tar.gz"
      sha256 "af69e727844759fa5360d20680721c71cb7499ba6a0f4afaa48fae70929dc7c1"
    end
    on_intel do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.2.1/modelgen-0.2.1-darwin-x64.tar.gz"
      sha256 "f8e565c209cc50bfa5c1acfdeb1eba042f6f34c2b3b069d14fe6d439483b293c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.2.1/modelgen-0.2.1-linux-arm64.tar.gz"
      sha256 "3f8ad3fb66cb31e38e12f8ee176bde58b8cfcf97ff8fb5d9a3442f199ebe5004"
    end
    on_intel do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.2.1/modelgen-0.2.1-linux-x64.tar.gz"
      sha256 "6dce5b3f9f3e754faf5b9b62ca22cabae7279be37e2ea455e31babd5d618e812"
    end
  end

  def install
    bin.install "modelgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modelgen --version")
  end
end
