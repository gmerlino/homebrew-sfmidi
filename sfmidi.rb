require "formula"

class Sfmidi < Formula
  homepage ""
  url "http://www.zorexxlkl.com/files/downloads/sfMidi-1.1.0-CMake.zip"
  sha1 "039edb82863e42bab213c6e60d9029396cb84d0b"

  depends_on "cmake" => :build
  depends_on "sfml" => :build
  depends_on "fluidsynth" => :build

  def install
    # Include Error.h among installed header files
    system '/usr/local/bin/gsed -i -e "s/.*Loader.h.*/\${INCSFMIDI}\/Loader.h\\n\${INCSFMIDI}\/Error.h/" CMakeLists.txt'
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
