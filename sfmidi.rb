class Sfmidi < Formula
  desc "SfMidi"
  homepage "https://github.com/JonnyPtn/sfMidi.git"
  head "https://github.com/JonnyPtn/sfMidi.git"

  depends_on "cmake" => :build
  depends_on "fluid-synth" => :build
  depends_on "sfml" => :build

  def install
    # Include Error.h among installed header files
    # system '/usr/local/bin/gsed -i -e "s/.*Loader.h.*/\${INCSFMIDI}\/Loader.h\\n\${INCSFMIDI}\/Error.h/" CMakeLists.txt'
    system "cmake", ".", "-DCMAKE_MODULE_PATH=#{Formula["sfml"].share}/SFML/cmake/Modules", "-DCMAKE_PREFIX_PATH=#{Formula["sfml"].share}/SFML/cmake/Modules", *std_cmake_args
    system "make", "install"
  end

  # to be fixed
  test do
    system "#{bin}/sfmidi", "--help"
  end
end
