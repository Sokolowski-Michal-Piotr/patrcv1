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
        includedirs {
            (OPENCV_DIR .. "/include")
        }

        filter "action:vs2015"
            libdirs {
                (OPENCV_DIR .. "/%{cfg.platform}/vc14/lib")
            }
        filter "action:gmake"
            libdirs {
                (OPENCV_DIR .. "/lib")

        filter { "action:vs*", "configurations:Debug" }
            links {
                "opencv_world310d"
            }
        filter { "action:vs*", "configurations:Release" }
            links {
                "opencv_world310"
            }
        filter { "action:gmake", "configurations:Debug" }
            links {
                "opencv_cored",
                "opencv_imgprocd",
                "opencv_imgcodecsd"
            }
        filter { "action:gmake", "configurations:Release" }
            links {
                "opencv_core",
                "opencv_imgproc",
                "opencv_imgcodecs"
            }
