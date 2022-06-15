#include "ViewportWindow.h"

#include <imgui.h>

#include "Renderer/Renderer.h"

using namespace Nightly;

namespace NightlyEditor
{
	void ViewportWindow::OnDraw()
	{
		ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, { 0, 0 });
		ImGui::Begin("Viewport", &m_IsOpen);
		ImGui::PopStyleVar();

		ImVec2 size = ImGui::GetContentRegionAvail();
		Renderer::SetViewportSize(Vec2(size.x, size.y));
		ImGui::Image(reinterpret_cast<ImTextureID>(Renderer::GetFramebuffer().GetColorBuffer()), size);

		ImGui::End();
	}
}