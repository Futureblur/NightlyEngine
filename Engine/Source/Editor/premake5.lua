project "NightlyEditor"
	kind "ConsoleApp"
	language "C++"
	objdir "%{BuildPath}"

	pchheader "PCH.h"
	pchsource "PCH.cpp"

	files
	{
		"**.h",
		"**.cpp"
	}

	includedirs
	{
		".",
		"%{RuntimePath}"
	}

	sysincludedirs
	{
		"%{ThirdParty.imgui}",
		"%{ThirdParty.glm}",
		"%{ThirdParty.glfw}/include"
	}

	links
	{
		"NightlyEngine",
		"imgui",
		"glfw",
		"glad"
	}

	filter "system:macosx"
		pchheader "%{RuntimePath}/PCH.h"

		links
		{
			"CoreFoundation.framework",
			"IOKit.framework",
			"Cocoa.framework"
		}

		removelinks
		{
			"glfw",
			"glad"
		}

	filter "system:windows"
		buildoptions
		{
			"/FI\"PCH.h\""
		}

		staticruntime "off"

	filter { "configurations:Debug", "system:windows" }
		runtime "Debug"

	filter { "configurations:Release", "system:windows" }
		runtime "Release"

	filter "system:linux"
		links
		{
			"dl",
			"pthread"
		}

		pic "on"