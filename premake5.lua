workspace "patrcv1"
    configurations { "Debug", "Release" }
    platforms { "x86", "x64" }
    startproject "exercise1"
    location "build"
    targetdir "bin/%{cfg.buildcfg}/%{cfg.platform}"

    filter "action:gmake"
        buildoptions { "-std=c++0x" }

    filter "configurations:Debug"
        defines "DEBUG"
        flags { "Symbols" }

    filter "configurations:Release"
        defines "NDEBUG"
        optimize "On"

    project "exercise1"
        kind "ConsoleApp"
        language "C++"
        namespace "exercise1"
        location "build/exercise1"
        files {
            "source/exercise1/**"
        }

    project "exercise2"
        kind "ConsoleApp"
        language "C++"
        namespace "exercise2"
        location "build/exercise2"
        files {
            "source/exercise2/**",
            "source/exercise1/**"
        }
        excludes {
            "source/exercise1/answers",
            "source/exercise1/main.cpp"
        }
        includedirs {
            "source/exercise1"
        }

    project "exercise3"
        kind "ConsoleApp"
        language "C++"
        namespace "exercise3"
        location "build/exercise3"
        files {
            "source/exercise3/**"
        }

        OPENCV_DIR = os.getenv("OPENCV_DIR")
        libdirs {
            (OPENCV_DIR .. "/%{cfg.platform}/" .. _ACTION .. "/lib")
        }

        includedirs {
            (OPENCV_DIR .. "/include")
        }

        configuration "Debug"
            links { "opencv_world310d" }
        configuration "Release"
            links { "opencv_world310" }
