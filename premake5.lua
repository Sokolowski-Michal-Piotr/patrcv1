workspace "patrcv1"
    configurations { "Debug", "Release" }
    startproject "exercise1"
    location "build"
    targetdir "bin"

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
            "source/exercise2/**"
        }

    project "exercise3"
        kind "ConsoleApp"
        language "C++"
        namespace "exercise3"
        location "build/exercise3"

        files {
            "source/exercise3/**"
        }
