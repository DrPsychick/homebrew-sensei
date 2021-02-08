class Sensei < Formula
  desc "A small macOS tool to read sensor information"
  homepage "https://github.com/DrPsychick/homebrew-sensei"
  url "https://github.com/DrPsychick/homebrew-sensei/archive/v0.0.1.tar.gz"
  sha256 "fbd5fff9a92ef53d78b7af0d237d643c67475c233d791e6f75b1449f56856f0f"
  license "GPL3"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on :xcode => "10.1"

  def install
    system "cmake", ".", "-GNinja", *std_cmake_args
    system "ninja", "install"
  end

  test do
    system "false"
  end
end
