class Sensei < Formula
  desc "A small macOS tool to read sensor information"
  homepage "https://github.com/DrPsychick/homebrew-sensei"
  url "https://github.com/DrPsychick/homebrew-sensei/archive/v0.0.2.tar.gz"
  sha256 "3cc8faa889c948edfdf011be29667b4d0e854d6ba7a91ce260116933732fcf6f"
  license "GPL3"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on :xcode => "10.1"

  def install
    system "cmake", ".", "-GNinja", *std_cmake_args
    system "ninja", "-v"
    system "ninja", "install", "-v"
  end

  test do
    system "false"
  end
end
