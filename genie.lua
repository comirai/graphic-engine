solution "Engine"
    configurations {"debug", "release"}
    language ("c++")
    platforms {"x64"}
    location ("build")
    debugdir ("build")
    targetdir ("bin")
    flags {"ExtraWarnings"}
project ("engine")
    kind ("ConsoleApp")
    includedirs {"include", "src/deps/glfw"}
    files {"src/*.cpp",
        "src/*.h",
        "include/**.h",
        "src/deps/glfw/context.c",
        "src/deps/glfw/init.c",
        "src/deps/glfw/input.c",
        "src/deps/glfw/monitor.c",
        "src/deps/glfw/window.c",
        "src/deps/glfw/vulkan.c",
        "src/deps/glfw/osmesa_context.c"
        }
    -- defines {}
    vpaths{ ["Headers"] = "include/*.h",
            ["Source"] = "src/*.cpp",
            ["Dependency Headers"] = {
                            "include/dxc/*",
                            "include/glfw/*",
                            "include/glm/**",
                            "include/glslang/**",
                            "include/shaderc/*",
                            "include/spirv_cross/*",
                            "include/spirv-headers/*",
                            "include/spirv-tools/*",
                            "include/vk_video/*",
                            "include/vulkan/*"
                            },
            ["Dependency Source"] = {
                               "src/deps/glfw/**"
                            },
    }
    configuration {"debug"}
        flags {"Symbols"}
        targetsuffix ("_d")
    configuration {"release"}
        flags {"Optimize"}
        targetsuffix ("_r")
    configuration {"windows"}
        libdirs {"lib/vulkan"}
        files {"src/deps/glfw/egl_context.c",
               "src/deps/glfw/win32*",
               "src/deps/glfw/wgl_*",
               "src/deps/glfw/winmm_*"}
        links {"vulkan-1"}
        defines {"_GLFW_WIN32", "_GLFW_WGL"}
        flags {"NoEditAndContinue"}
        windowstargetplatformversion "10.0.18362.0"