class Sensei < Formula
  desc "A small macOS tool to read sensor information"
  homepage "https://github.com/DrPsychick/homebrew-sensei"
  url "https://github.com/DrPsychick/homebrew-sensei/archive/v0.0.2.tar.gz"
  sha256 "0e03f060143baeb321eea0e943708e72ad400bff95b46878fde560a4f1a1c95c"
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
