class Modelgen < Formula
  desc "Generate 3D models (GLB, USDZ) from a CLI or an MCP server"
  homepage "https://github.com/Guilospanck/modelgen"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.1/modelgen-0.3.1-darwin-arm64.tar.gz"
      sha256 "86eaf4fe152885ed57b50c5bcee19c338d228b9b5d7517cf891a8c891d1101bf"
    end
    on_intel do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.1/modelgen-0.3.1-darwin-x64.tar.gz"
      sha256 "e52e69230bf915fcd663e06c3243582671a5afe9ed4056ebd7a044784e9d841c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.1/modelgen-0.3.1-linux-arm64.tar.gz"
      sha256 "c4b529b334673a825e541873039bc9900c14e4383608261c3f71330c8a80cbd0"
    end
    on_intel do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.1/modelgen-0.3.1-linux-x64.tar.gz"
      sha256 "332498f56a3e3133486d44ea9409fd97b68b746a41091f8185fdcc25d3e738d8"
    end
  end

  def install
    bin.install "modelgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modelgen --version")
  end
end
