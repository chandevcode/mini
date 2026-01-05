module ApplicationHelper
  def flash_icon(type)
    case type.to_sym
    when :success, :notice
      content_tag(:svg, xmlns: "http://www.w3.org/2000/svg", class: "stroke-current flex-shrink-0 h-6 w-6", fill: "none", viewBox: "0 0 24 24") do
        content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2", d: "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z")
      end
    when :error, :alert
      content_tag(:svg, xmlns: "http://www.w3.org/2000/svg", class: "stroke-current flex-shrink-0 h-6 w-6", fill: "none", viewBox: "0 0 24 24") do
        content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2", d: "M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z")
      end
    when :warning
      content_tag(:svg, xmlns: "http://www.w3.org/2000/svg", class: "stroke-current flex-shrink-0 h-6 w-6", fill: "none", viewBox: "0 0 24 24") do
        content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2", d: "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.998-.833-2.732 0L3.34 16.5c-.77.833.192 2.5 1.732 2.5z")
      end
    else # info
      content_tag(:svg, xmlns: "http://www.w3.org/2000/svg", class: "stroke-current flex-shrink-0 h-6 w-6", fill: "none", viewBox: "0 0 24 24") do
        content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2", d: "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z")
      end
    end
  end
end
