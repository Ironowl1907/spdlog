project("SpdLog")
kind("StaticLib")
language("C++")
staticruntime("on")
warnings("off")

targetdir("bin/%{prj.name}")
objdir("bin-int/%{prj.name}")
defines("SPDLOG_COMPILED_LIB")
files({
	"src/**.cpp",
	"/include/**.h",
})

filter("system:linux")
pic("On")
systemversion("latest")
files({
	"src/**.c",
})
defines({
	"_GLFW_X11",
})

filter("system:macosx")
pic("On")
files({
	"src/cocoa_init.m",
	"src/cocoa_monitor.m",
	"src/cocoa_window.m",
	"src/cocoa_joystick.m",
	"src/cocoa_time.c",
	"src/nsgl_context.m",
	"src/posix_thread.c",
	"src/posix_module.c",
	"src/osmesa_context.c",
	"src/egl_context.c",
})
defines({
	"_GLFW_COCOA",
})

filter("system:windows")
systemversion("latest")
files({
	"src/win32_init.c",
	"src/win32_joystick.c",
	"src/win32_module.c",
	"src/win32_monitor.c",
	"src/win32_time.c",
	"src/win32_thread.c",
	"src/win32_window.c",
	"src/wgl_context.c",
	"src/egl_context.c",
	"src/osmesa_context.c",
})
defines({
	"_GLFW_WIN32",
	"_CRT_SECURE_NO_WARNINGS",
})

filter("configurations:Debug")
runtime("Debug")
symbols("on")

filter("configurations:Release")
runtime("Release")
optimize("speed")

filter("configurations:Dist")
runtime("Release")
optimize("speed")
symbols("off")
