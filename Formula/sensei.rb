class Sensei < Formula
  desc "A small macOS tool to read sensor information"
  homepage "https://github.com/DrPsychick/homebrew-sensei"
  url "https://github.com/DrPsychick/homebrew-sensei/archive/v0.0.3.tar.gz"
  sha256 "831400ebab0302e08e0904556e21d1f4368ddeb660caf99d9561dab5e5098c0a"
  license "GPL3"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on macos:

  def install
    system "cmake", ".", "-GNinja", *std_cmake_args
    system "ninja", "-v"
    system "ninja", "install", "-v"
  end

  test do
    system "false"
  end
end
